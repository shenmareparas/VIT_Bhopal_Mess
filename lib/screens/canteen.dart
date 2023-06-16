import 'package:flutter/material.dart';
import '/models/map.dart';

class Menu {
  final String name;
  int price;
  int quantity;

  Menu({required this.name, required this.price, required this.quantity});
}

class Canteen extends StatefulWidget {
  const Canteen({super.key});

  @override
  State<Canteen> createState() => CanteenState();
}

class CanteenState extends State<Canteen> {
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
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
                child: Scrollbar(
                  radius: const Radius.circular(10),
                  thickness: 10,
                  interactive: true,
                  trackVisibility: true,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(thickness: 1, height: 1),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return ListTile(
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
                                  : const Color(0xFFD0EE82)),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              tooltip: 'Remove',
                              onPressed: () {
                                setState(() {
                                  if (item.quantity > 0) {
                                    item.quantity--;
                                  }
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
                                  fontSize: 18),
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
                        ),
                      );
                    },
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
                      width: 3),
                  bottom: const BorderSide(width: 0),
                  left: const BorderSide(width: 0),
                  right: const BorderSide(width: 0)),
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
                  'Total Price: ₹${getTotalPrice().toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ));
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
