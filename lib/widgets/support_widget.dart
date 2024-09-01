import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold);
  }

  static lightTextFieldStyle() {
    return const TextStyle(
        color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w500);
  }

  static TextStyle semiBoldTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle orangeSeeALlTextStyle() {
    return const TextStyle(
      color: Color(0xfffd6f3e),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }
}
