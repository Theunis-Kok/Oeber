import 'package:flutter/material.dart';

textfieldDecoration(Icon leadingIcon, String hintText) {
  final InputDecoration inputDecoration = InputDecoration(
    prefixIcon: leadingIcon,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide.none,
    ),
    filled: true,
    hintText: hintText,
  );

  return inputDecoration;
}
