import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import '/models/map.dart';
import 'cartM.dart';

class MenuM {
  String name;
  int price;
  String category;
  int quantity;

  MenuM(
      {required this.name,
      required this.price,
      required this.category,
      this.quantity = 0});
}

class Mayuri extends StatefulWidget {
  const Mayuri({super.key});

  @override
  State<Mayuri> createState() => MayuriState();
}

class MayuriState extends State<Mayuri> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _searchFocusNode = FocusNode();

  String searchQueryM = '';
  List<MenuM> selectedItemsM = [];
  final List<MenuM> _originalItemsM = itemsM.toList();

  List<MenuM> get filteredItems {
    if (searchQueryM.isEmpty) {
      return itemsM;
    } else {
      return itemsM
          .where((item) =>
              item.name.toLowerCase().contains(searchQueryM.toLowerCase()))
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
                          searchQueryM = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        labelText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: searchQueryM.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    searchQueryM = '';
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
                          return FadeInUp(
                            duration: const Duration(milliseconds: 400),
                            child: const Column(
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
                            ),
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
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        showHeaderOptionsDialog(context),
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          color: Color(0xFFD0EE82)),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
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
                              FadeInUp(
                                duration: const Duration(milliseconds: 400),
                                child: ListTile(
                                  title: Text(
                                    item.name,
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                  subtitle: Text(
                                    '₹${item.price.toStringAsFixed(0)}',
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
                                          icon: const Icon(
                                              Icons.add_shopping_cart),
                                          tooltip: 'Add to Cart',
                                          onPressed: () {
                                            setState(() {
                                              item.quantity++;
                                            });
                                          },
                                        ),
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
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${getSelectedItemsCount()} Item  |  ₹${getTotalPrice().toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 17),
              ),
              ElevatedButton(
                onPressed: () {
                  List<MenuM> selectedItemsM =
                      itemsM.where((item) => item.quantity > 0).toList();
                  for (var itemM in selectedItemsM) {
                    itemM.quantity = itemM.quantity;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CartM(selectedItemsM: selectedItemsM)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(color: Color(0xFFD0EE82)),
                ),
                child: const Row(
                  children: [
                    Text(
                      'View Cart  ',
                      style: TextStyle(fontSize: 17),
                    ),
                    Icon(Icons.shopping_cart),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showHeaderOptionsDialog(BuildContext context) {
    final Set<String> uniqueCategories =
        Set<String>.from(_originalItemsM.map((item) => item.category));
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
                    return FadeInUp(
                      duration: const Duration(milliseconds: 300),
                      delay: Duration(milliseconds: 50 * index),
                      child: ListTile(
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
                            final headerIndex = _originalItemsM.indexWhere(
                                (item) => item.category == category);
                            if (headerIndex != -1) {
                              _scrollController.animateTo(
                                headerIndex * 77.5,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            }
                          }
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(color: Color(0xFFD0EE82)),
              ),
              child: const Text('Close', style: TextStyle(fontSize: 17)),
            ),
          ],
        );
      },
    );
  }

  void sortByAscending() {
    List<MenuM> sortedItemsM = List.from(itemsM);
    sortedItemsM.sort((a, b) => a.price.compareTo(b.price));
    setState(() {
      itemsM = sortedItemsM;
    });
  }

  void sortByDescending() {
    List<MenuM> sortedItemsM = List.from(itemsM);
    sortedItemsM.sort((a, b) => b.price.compareTo(a.price));
    setState(() {
      itemsM = sortedItemsM;
    });
  }

  void sortByCategory() {
    setState(() {
      itemsM = _originalItemsM.toList();
    });
  }

  int getSelectedItemsCount() {
    return itemsM.where((item) => item.quantity > 0).length;
  }

  double getTotalPrice() {
    return itemsM.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
