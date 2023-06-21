import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'cart.dart';
import '/models/map.dart';

class Menu {
  String name;
  int price;
  int quantity;

  Menu({required this.name, required this.price, this.quantity = 0});
}

class Canteen extends StatefulWidget {
  const Canteen({super.key});

  @override
  State<Canteen> createState() => CanteenState();
}

class CanteenState extends State<Canteen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool _isFabvisible = true;
  String searchQuery = '';
  List<Menu> selectedItems = [];
  final List<Menu> _originalItems = items.toList();

  List<Menu> get filteredItems {
    if (searchQuery.isEmpty) {
      return items;
    } else {
      return items
          .where((item) =>
              item.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        labelText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: searchQuery.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    searchQuery = '';
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
                  return true;
                },
                child: DraggableScrollbar.semicircle(
                  controller: _scrollController,
                  scrollbarTimeToFade: const Duration(milliseconds: 1300),
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFF4E6700)
                          : const Color(0xFFD0EE82),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return ListTile(
                        title: Text(
                          item.name,
                          style: const TextStyle(fontSize: 17),
                        ),
                        subtitle: Text(
                          '₹ ${item.price.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).brightness == Brightness.light
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
                                      color: Theme.of(context).brightness ==
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
                                icon: const Icon(Icons.add_shopping_cart),
                                tooltip: 'Add to Cart',
                                onPressed: () {
                                  setState(() {
                                    item.quantity++;
                                  });
                                },
                              ),
                      );
                    },
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
                  List<Menu> selectedItems =
                      items.where((item) => item.quantity > 0).toList();
                  for (var item in selectedItems) {
                    item.quantity = item.quantity;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Cart(selectedItems: selectedItems)),
                  );
                },
                child: const Icon(Icons.shopping_cart),
              )
            : null,
      ),
    );
  }

  void sortByAscending() {
    List<Menu> sortedItems = List.from(items);
    sortedItems.sort((a, b) => a.price.compareTo(b.price));
    setState(() {
      items = sortedItems;
    });
  }

  void sortByDescending() {
    List<Menu> sortedItems = List.from(items);
    sortedItems.sort((a, b) => b.price.compareTo(a.price));
    setState(() {
      items = sortedItems;
    });
  }

  void sortByCategory() {
    setState(() {
      items = _originalItems.toList();
    });
  }

  int getSelectedItemsCount() {
    return items.where((item) => item.quantity > 0).length;
  }

  double getTotalPrice() {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
