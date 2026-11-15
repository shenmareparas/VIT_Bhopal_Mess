// ignore_for_file: file_names

import 'package:material_ui/material_ui.dart';
import 'package:vit_bhopal_mess/models/menu_item.dart';
import 'package:vit_bhopal_mess/screens/generic_cart_screen.dart';

typedef MenuM = MenuItem;

class CartM extends StatelessWidget {
  final List<MenuItem> selectedItemsM;

  const CartM({super.key, required this.selectedItemsM});

  @override
  Widget build(BuildContext context) {
    return GenericCartScreen(
      title: 'Cart',
      selectedItems: selectedItemsM,
    );
  }
}
