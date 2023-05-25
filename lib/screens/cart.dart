import 'package:flutter/material.dart';
import 'canteen.dart';

class Cart extends StatefulWidget {
  final List<Menu> selectedItems;

  const Cart({Key? key, required this.selectedItems}) : super(key: key);

  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  List<Menu> get selectedItems => widget.selectedItems;

  int get totalPrice {
    return selectedItems.fold(0, (total, item) => total + item.price);
  }

  void removeFromCart(Menu item) {
    setState(() {
      item.isSelected = false;
      selectedItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: selectedItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = selectedItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('₹${item.price}'),
            trailing: IconButton(
              icon: const Icon(Icons.remove_shopping_cart),
              onPressed: () => removeFromCart(item),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ₹$totalPrice',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Place the logic for completing the purchase here
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Order Placed'),
                        content: const Text('Your order has been placed.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedItems.clear();
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
