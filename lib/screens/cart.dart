import 'package:material_ui/material_ui.dart';
import 'package:vit_bhopal_mess/models/menu_item.dart';
import 'package:vit_bhopal_mess/screens/generic_cart_screen.dart';

typedef Menu = MenuItem;

class Cart extends StatelessWidget {
  final List<MenuItem> selectedItems;

  const Cart({super.key, required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    return GenericCartScreen(
      title: 'Cart',
      selectedItems: selectedItems,
    );
  }
}
