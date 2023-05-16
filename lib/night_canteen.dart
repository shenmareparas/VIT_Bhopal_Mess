import 'package:flutter/material.dart';
import 'map.dart';

class Menu {
  final String name;
  int price;

  Menu({required this.name, required this.price});
}

class NightCanteen extends StatefulWidget {
  const NightCanteen({super.key});

  @override
  State<NightCanteen> createState() => NightCanteenState();
}

class NightCanteenState extends State<NightCanteen> {
  final List<Menu> _originalItems = items.toList();

  void sortItemsByAscending() {
    List<Menu> sortedItems = List.from(items);
    sortedItems.sort((a, b) => a.price.compareTo(b.price));
    setState(() {
      items = sortedItems;
    });
  }

  void sortItemsByDescending() {
    List<Menu> sortedItems = List.from(items);
    sortedItems.sort((a, b) => b.price.compareTo(a.price));
    setState(() {
      items = sortedItems;
    });
  }

  void resetItems() {
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
            onTap: sortItemsByAscending,
            child: const Text('Sort by Price: Low to High'),
          ),
          PopupMenuItem(
            onTap: sortItemsByDescending,
            child: const Text('Sort by Price: High to Low'),
          ),
          PopupMenuItem(
            onTap: resetItems,
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
