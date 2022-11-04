
import 'package:flutter/material.dart';

extension SnackBarShower on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(message,style: const TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}