import 'package:flutter/material.dart';
import '../models/map.dart';

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
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
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
                    PopupMenuButton(
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
                      child: const FloatingActionButton(
                        elevation: 5,
                        onPressed: null,
                        child: Icon(Icons.filter_list),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle:
                          Text('Price: ₹${item.price.toStringAsFixed(2)}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (item.quantity > 0) {
                                  item.quantity--;
                                }
                              });
                            },
                          ),
                          Text(item.quantity.toString()),
                          IconButton(
                            icon: const Icon(Icons.add),
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
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Items: ${getSelectedItemsCount()}',
                      style: const TextStyle(),
                    ),
                    Text(
                      'Total Price: ₹${getTotalPrice().toStringAsFixed(2)}',
                      style: const TextStyle(),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        showReceiptDialog();
                      },
                      child: const Icon(Icons.receipt),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void showReceiptDialog() {
    if (selectedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No items selected')),
      );
      return;
    }

    String message = 'Receipt\n\n';
    for (var item in selectedItems) {
      message += '${item.name} x ${item.quantity}\n';
    }
    message += '\nTotal: ₹${getTotalPrice().toStringAsFixed(2)}';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Receipt'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
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
