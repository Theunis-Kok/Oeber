import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeeType;
  final bool isSelected;
  final VoidCallback onTap;

  const CoffeeType({
    super.key,
    required this.coffeeType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              coffeeType,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.orange : Colors.white,
              ),
            ),
            isSelected
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.orange : Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
