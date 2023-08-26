import 'package:flutter/material.dart';

class BackArrow extends StatefulWidget {
  const BackArrow({super.key});

  @override
  State<BackArrow> createState() => _BackArrowState();
}

class _BackArrowState extends State<BackArrow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, left: 16),
      child: Row(
        children: [
          GestureDetector(
            child: const Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.white,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
