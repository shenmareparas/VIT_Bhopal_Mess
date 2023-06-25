import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import '/models/map.dart';
import 'cartUB.dart';

class MenuUB {
  String name;
  int price;
  String category;
  int quantity;

  MenuUB(
      {required this.name,
      required this.price,
      required this.category,
      this.quantity = 0});
}

class UnderBelly extends StatefulWidget {
  const UnderBelly({super.key});

  @override
  State<UnderBelly> createState() => UnderBellyState();
}

class UnderBellyState extends State<UnderBelly> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _searchFocusNode = FocusNode();

  bool _isFabvisible = true;
  String searchQueryUB = '';
  List<MenuUB> selectedItemsUB = [];
  final List<MenuUB> _originalItemsUB = itemsUB.toList();

  List<MenuUB> get filteredItems {
    if (searchQueryUB.isEmpty) {
      return itemsUB;
    } else {
      return itemsUB
          .where((item) =>
              item.name.toLowerCase().contains(searchQueryUB.toLowerCase()))
          .toList();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void unfocusSearchField() {
    _searchFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocusSearchField(),
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      onChanged: (value) {
                        setState(() {
                          searchQueryUB = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        labelText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: searchQueryUB.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    searchQueryUB = '';
                                  });
                                  _searchController.clear();
                                },
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: PopupMenuButton(
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        onTap: sortByAscending,
                        child: const Text('Sort by Price: Low to High'),
                      ),
                      PopupMenuItem(
                        onTap: sortByDescending,
                        child: const Text('Sort by Price: High to Low'),
                      ),
                      PopupMenuItem(
                        onTap: sortByCategory,
                        child: const Text('Sort by Category'),
                      ),
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    tooltip: 'Sort',
                    child: const FloatingActionButton(
                      elevation: 5,
                      onPressed: null,
                      child: Icon(Icons.filter_list),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  if (notification.direction == ScrollDirection.forward) {
                    setState(() => _isFabvisible = true);
                  } else if (notification.direction ==
                      ScrollDirection.reverse) {
                    setState(() => _isFabvisible = false);
                  }
                  unfocusSearchField();
                  return true;
                },
                child: GestureDetector(
                  onTap: () => unfocusSearchField(),
                  child: DraggableScrollbar.semicircle(
                    controller: _scrollController,
                    scrollbarTimeToFade: const Duration(milliseconds: 1300),
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF4E6700)
                            : const Color(0xFFD0EE82),
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount:
                          filteredItems.isEmpty ? 1 : filteredItems.length,
                      itemBuilder: (context, index) {
                        if (filteredItems.isEmpty) {
                          return const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 80,
                              ),
                              Text(
                                'Item not available',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          );
                        } else {
                          final item = filteredItems[index];
                          // Check if the current item's category is different from the previous item's category
                          final bool showCategoryHeader = index == 0 ||
                              item.category !=
                                  filteredItems[index - 1].category;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (showCategoryHeader)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 16, bottom: 5),
                                  child: OutlinedButton(
                                    onPressed: () =>
                                        showHeaderOptionsDialog(context),
                                    child: Text(
                                      item.category,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? const Color(0xFF4E6700)
                                            : const Color(0xFFD0EE82),
                                      ),
                                    ),
                                  ),
                                ),
                              ListTile(
                                title: Text(
                                  item.name,
                                  style: const TextStyle(fontSize: 17),
                                ),
                                subtitle: Text(
                                  '₹ ${item.price.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? const Color(0xFF4E6700)
                                        : const Color(0xFFD0EE82),
                                  ),
                                ),
                                trailing: item.quantity > 0
                                    ? Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.remove),
                                            tooltip: 'Remove',
                                            onPressed: () {
                                              setState(() {
                                                item.quantity--;
                                              });
                                            },
                                          ),
                                          Text(
                                            '${item.quantity}',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? const Color(0xFF4E6700)
                                                  : const Color(0xFFD0EE82),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.add),
                                            tooltip: 'Add',
                                            onPressed: () {
                                              setState(() {
                                                item.quantity++;
                                              });
                                            },
                                          ),
                                        ],
                                      )
                                    : IconButton(
                                        icon:
                                            const Icon(Icons.add_shopping_cart),
                                        tooltip: 'Add to Cart',
                                        onPressed: () {
                                          setState(() {
                                            item.quantity++;
                                          });
                                        },
                                      ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).brightness == Brightness.light
                    ? const Color(0xFF4E6700)
                    : const Color(0xFFD0EE82),
                width: 3,
              ),
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selected Items: ${getSelectedItemsCount()}',
                style: const TextStyle(fontSize: 17),
              ),
              Text(
                'Total Price: ₹ ${getTotalPrice().toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
        floatingActionButton: _isFabvisible
            ? FloatingActionButton(
                tooltip: "Cart",
                onPressed: () {
                  List<MenuUB> selectedItemsUB =
                      itemsUB.where((item) => item.quantity > 0).toList();
                  for (var itemUB in selectedItemsUB) {
                    itemUB.quantity = itemUB.quantity;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CartUB(selectedItemsUB: selectedItemsUB)),
                  );
                },
                child: const Icon(Icons.shopping_cart),
              )
            : null,
      ),
    );
  }

  void showHeaderOptionsDialog(BuildContext context) {
    final Set<String> uniqueCategories =
        Set<String>.from(_originalItemsUB.map((item) => item.category));
    final List<String> categoriesList = uniqueCategories.toList();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Categories', textAlign: TextAlign.center),
          content: SizedBox(
            width: double.maxFinite,
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(categoriesList.length, (index) {
                    final category = categoriesList[index];
                    return ListTile(
                      title: Text(
                        category,
                        style: const TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        // Scroll to the selected category
                        final categoryIndex = filteredItems
                            .indexWhere((item) => item.category == category);
                        if (categoryIndex != -1) {
                          final headerIndex = _originalItemsUB
                              .indexWhere((item) => item.category == category);
                          if (headerIndex != -1) {
                            _scrollController.animateTo(
                              headerIndex * 77,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        }
                      },
                    );
                  }),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void sortByAscending() {
    List<MenuUB> sortedItemsUB = List.from(itemsUB);
    sortedItemsUB.sort((a, b) => a.price.compareTo(b.price));
    setState(() {
      itemsUB = sortedItemsUB;
    });
  }

  void sortByDescending() {
    List<MenuUB> sortedItemsUB = List.from(itemsUB);
    sortedItemsUB.sort((a, b) => b.price.compareTo(a.price));
    setState(() {
      itemsUB = sortedItemsUB;
    });
  }

  void sortByCategory() {
    setState(() {
      itemsUB = _originalItemsUB.toList();
    });
  }

  int getSelectedItemsCount() {
    return itemsUB.where((item) => item.quantity > 0).length;
  }

  double getTotalPrice() {
    return itemsUB.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
