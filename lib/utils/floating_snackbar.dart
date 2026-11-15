import 'package:material_ui/material_ui.dart';

void showFloatingSnackbar(BuildContext context, String message) {
  final snackBar =
      SnackBar(behavior: SnackBarBehavior.floating, content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
