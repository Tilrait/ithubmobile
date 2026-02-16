import 'package:flutter/material.dart';

abstract class AppTheme {
  static final base = ThemeData(
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 14, fontFamily: 'RobotoMono'),
      bodyLarge: TextStyle(fontSize: 16, fontFamily: 'RobotoMono'),
      headlineMedium: TextStyle(fontSize: 20, fontFamily: 'RobotoMono'),
    ),
  );
}
