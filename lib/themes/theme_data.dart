import 'package:flutter/material.dart';

ThemeData mainTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: const Color.fromARGB(255, 139, 123, 85),
    scaffoldBackgroundColor: const Color(0xFF171413),
    textTheme: TextTheme(
      bodyLarge: defaultTextStyle(),
      bodyMedium: defaultTextStyle(),
      bodySmall: defaultTextStyle(),
    ),
  );
}

TextStyle defaultTextStyle() {
  return const TextStyle(color: Colors.white, fontSize: 18);
}
