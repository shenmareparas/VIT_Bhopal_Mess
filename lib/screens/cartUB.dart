// ignore_for_file: file_names

import 'package:material_ui/material_ui.dart';
import 'package:vit_bhopal_mess/models/menu_item.dart';
import 'package:vit_bhopal_mess/screens/generic_cart_screen.dart';

typedef MenuUB = MenuItem;

class CartUB extends StatelessWidget {
  final List<MenuItem> selectedItemsUB;

  const CartUB({super.key, required this.selectedItemsUB});

  @override
  Widget build(BuildContext context) {
    return GenericCartScreen(
      title: 'Cart',
      selectedItems: selectedItemsUB,
      phoneNumber: '8969073110',
    );
  }
}
