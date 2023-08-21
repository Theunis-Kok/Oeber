import 'package:flutter/material.dart';

Color mainBackgroundColour = const Color(0xFF171413);
Color greyBackgroundColour = const Color(0xFF1F222A);

ThemeData mainTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: const Color.fromARGB(255, 139, 123, 85),
    scaffoldBackgroundColor: mainBackgroundColour,
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
