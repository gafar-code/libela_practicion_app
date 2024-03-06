import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showSnackBarError(BuildContext context, String message) {
    _showSnackBar(context, message);
  }

  static void showSnackBarSuccess(BuildContext context, String message) {
    _showSnackBar(context, message, const Color(0xff333333).withOpacity(0.9));
  }

  static void _showSnackBar(BuildContext context, String message,
      [Color? background]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 8.0,
        backgroundColor: background ?? Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
    );
  }
}
