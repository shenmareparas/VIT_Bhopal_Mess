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
  int _sortCounter = 0;
  final List<Menu> _originalItems = items.toList();

  void sortItems() {
    List<Menu> sortedItems =
        List.from(items); // create a new list and copy contents of items
    setState(() {
      _sortCounter++;
      if (_sortCounter == 1) {
        sortedItems.sort((a, b) => a.price.compareTo(b.price));
      } else if (_sortCounter == 2) {
        sortedItems.sort((a, b) => b.price.compareTo(a.price));
      } else {
        sortedItems = List.from(_originalItems); // restore original order
        _sortCounter = 0;
      }
      items = sortedItems; // update items with the sorted list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length + 1, // add 1 for header row
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
            int itemIndex = index - 1; // adjust index for header row
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
      floatingActionButton: FloatingActionButton(
        onPressed: sortItems,
        child: const Icon(Icons.sort),
      ),
    );
  }
}
