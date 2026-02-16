import 'package:flutter/material.dart';

abstract class AppTypography {
  static const _fontName = 'RobotoMono';

  static final regular14 = TextStyle(
    fontFamily: _fontName,
    fontSize: 14,
  );

  static const bold16 = TextStyle(
    fontFamily: _fontName,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}