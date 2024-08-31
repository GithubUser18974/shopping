import 'package:flutter/material.dart';
import 'package:flutter_work/pages/main/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List myList = [
    {"name": "mohamed", "lastName": "Araby", "age": 20},
    {"name": "ahmed", "lastName": "essawy", "age": 20},
    {"name": "mahmoud", "lastName": "sabry", "age": 20},
    {"name": "ebrahim", "lastName": "hassan", "age": 20},
    {"name": "hamza", "lastName": "eitman", "age": 20},
    {"name": "moaaz", "lastName": "hamdy", "age": 20},
    {"name": "abdou", "lastName": "fawzy", "age": 20},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
