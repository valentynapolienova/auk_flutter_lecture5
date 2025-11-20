import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._(); // private constructor — prevents instantiation.

  // Colors (you can move them to a separate file later).
  static const Color blueGray = Color(0xFF607D8B); // Material blue-gray.
  static const Color black = Colors.black;

  /// Weight 400 (regular)
  static const TextStyle body400 = TextStyle(
    fontWeight: FontWeight.w400,
    color: black,
    fontSize: 16,
  );

  static const TextStyle body400BlueGray = TextStyle(
    fontWeight: FontWeight.w400,
    color: blueGray,
    fontSize: 16,
  );

  /// Weight 600 (semi-bold)
  static const TextStyle h1 = TextStyle(
    fontWeight: FontWeight.w600,
    color: black,
    fontSize: 24,
  );

  static const TextStyle body600 = TextStyle(
    fontWeight: FontWeight.w600,
    color: black,
    fontSize: 16,
  );

  static const TextStyle body600BlueGray = TextStyle(
    fontWeight: FontWeight.w600,
    color: blueGray,
    fontSize: 16,
  );
}
