import 'package:flutter/material.dart';
import 'map.dart';

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
  final List<Menu> _originalItems = items.toList();

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
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            // header row

            return const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Item',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            );
          } else {
            // menu item row
            int itemIndex = index - 1;
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        items[itemIndex].name,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        '₹${items[itemIndex].price}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: PopupMenuButton(
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
          onPressed: null,
          child: Icon(Icons.sort),
        ),
      ),
    );
  }
}
