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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items[index].name,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      '₹${items[index].price}',
                      style: const TextStyle(
                        fontSize: 18.0,
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
        },
      ),
    );
  }
}
