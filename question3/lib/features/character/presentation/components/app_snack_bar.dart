import 'package:flutter/material.dart';

class AppSnackBar {
  final BuildContext context;

  AppSnackBar(this.context);

  void show({required String message}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white70,
        ),
      ),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.fixed,
    );

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
