import 'package:flutter/material.dart';

void showFloatingSnackbar(BuildContext context, String message) {
  final snackBar =
      SnackBar(behavior: SnackBarBehavior.floating, content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
