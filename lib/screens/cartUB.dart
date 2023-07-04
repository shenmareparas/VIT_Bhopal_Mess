// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'underbelly.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartUB extends StatefulWidget {
  final List<MenuUB> selectedItemsUB;

  const CartUB({Key? key, required this.selectedItemsUB}) : super(key: key);

  @override
  CartUBState createState() => CartUBState();
}

class CartUBState extends State<CartUB> {
  UnderBellyState underBellyState = UnderBellyState();
  late List<bool> _fadeOutList;

  @override
  void initState() {
    super.initState();
    _fadeOutList = List.generate(widget.selectedItemsUB.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart', style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            widget.selectedItemsUB.isEmpty
                ? FadeInUp(
                    duration: const Duration(milliseconds: 400),
                    child: const Center(
                      child: Text(
                        'No items are selected',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                : Scrollbar(
                    radius: const Radius.circular(10),
                    thickness: 10,
                    interactive: true,
                    trackVisibility: true,
                    child: ListView.builder(
                      itemCount: widget.selectedItemsUB.length,
                      itemBuilder: (context, index) {
                        final item = widget.selectedItemsUB[index];
                        return _fadeOutList[index]
                            ? FadeOutRight(
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
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        tooltip: 'Remove',
                                        onPressed: () {},
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
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : FadeInUp(
                                duration: const Duration(milliseconds: 400),
                                delay: Duration(milliseconds: 100 * index),
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
                                              if (item.quantity == 0) {
                                                _fadeOutList[index] = true;
                                                Future.delayed(
                                                  const Duration(
                                                      milliseconds: 400),
                                                  () {
                                                    setState(() {
                                                      widget.selectedItemsUB
                                                          .removeAt(index);
                                                      _fadeOutList
                                                          .removeAt(index);
                                                    });
                                                  },
                                                );
                                              }
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
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
          ],
        ),
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
              '${underBellyState.getSelectedItemsCount()} Item  |  ₹${underBellyState.getTotalPrice().toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 17),
            ),
            ElevatedButton(
              onPressed: () {
                String url = Uri.encodeFull('https://wa.me/918969073110');
                launchUrlString(url);
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
                    'Send Order  ',
                    style: TextStyle(fontSize: 17),
                  ),
                  Icon(FontAwesomeIcons.whatsapp),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
