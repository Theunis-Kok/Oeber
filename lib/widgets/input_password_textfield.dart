import 'package:flutter/material.dart';

import '../methods/validation_methods.dart';

class InputPasswordTextField extends StatefulWidget {
  final String hintText;
  final Icon leadingIcon;
  final TextEditingController controller;

  const InputPasswordTextField(this.hintText, this.leadingIcon, this.controller,
      {super.key});

  @override
  State<InputPasswordTextField> createState() => _InputPasswordTextFieldState();
}

class _InputPasswordTextFieldState extends State<InputPasswordTextField> {
  bool _visiblePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: widget.leadingIcon,
        suffixIcon: GestureDetector(
          child: Icon(
            _visiblePassword ? Icons.visibility : Icons.visibility_off,
            size: 30,
          ),
          onTap: () => setState(() => _visiblePassword = !_visiblePassword),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        hintText: widget.hintText,
      ),
      obscureText: _visiblePassword,
      controller: widget.controller,
      validator: (password) => passwordValidator(password),
    );
  }
}
