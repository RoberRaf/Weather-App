import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Alerts {
  Alerts._();
  static void showToast(
    String message, {
    Toast length = Toast.LENGTH_SHORT,
    ToastGravity toastGravity = ToastGravity.BOTTOM,
    bool error = true,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: toastGravity,
      timeInSecForIosWeb: 3,
      fontSize: 16,
      backgroundColor: error ? Colors.red : Colors.white,
      textColor: error ? Colors.white : Colors.black,
    );
  }
}
