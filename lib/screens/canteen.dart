import 'package:flutter/material.dart';

import '../models/map.dart';

class Menu {
  final String name;
  int price;

  Menu({required this.name, required this.price});
}

class Canteen extends StatefulWidget {
  const Canteen({super.key});

  @override
  State<Canteen> createState() => CanteenState();
}

class CanteenState extends State<Canteen> {
  String searchQuery = '';
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(13),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the desired border radius
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
                      elevation: 0,
                      onPressed: null,
                      child: Icon(Icons.sort),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: filteredItems.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  thickness: 1,
                  height: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final item = filteredItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ListTile(
                      title: Text(
                        item.name,
                        style: const TextStyle(fontSize: 18),
                      ),
                      trailing: Text(
                        '₹${item.price}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
