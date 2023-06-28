import 'package:flutter/material.dart';
import 'canteen.dart';

class Cart extends StatefulWidget {
  final List<Menu> selectedItems;

  const Cart({Key? key, required this.selectedItems}) : super(key: key);

  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  CanteenState canteenState = CanteenState();

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
            widget.selectedItems.isEmpty
                ? const Center(
                    child: Text(
                      'No items are selected',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : Scrollbar(
                    radius: const Radius.circular(10),
                    thickness: 10,
                    interactive: true,
                    trackVisibility: true,
                    child: ListView.builder(
                      itemCount: widget.selectedItems.length,
                      itemBuilder: (context, index) {
                        final item = widget.selectedItems[index];
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
                                      if (item.quantity == 0) {
                                        widget.selectedItems.removeAt(index);
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
              '${canteenState.getSelectedItemsCount()} Item  |  ₹${canteenState.getTotalPrice().toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
