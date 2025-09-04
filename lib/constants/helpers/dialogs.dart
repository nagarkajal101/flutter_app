import 'package:flutter/material.dart';

//Snackbar
class Dialogs {
  static void showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        backgroundColor: Colors.pink.shade100.withOpacity(.8),
        behavior: SnackBarBehavior.floating));
  }

  //progress indicator
  static void showLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) =>
        const Center(child: CircularProgressIndicator(strokeWidth: 1)));
  }
}