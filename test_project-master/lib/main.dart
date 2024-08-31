import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/src/core/app.dart';

void main() {
  runApp(
    ProviderScope(child: const App()),
  );
}
