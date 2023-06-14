import 'package:flutter/material.dart';

class MealListItemTrait extends StatelessWidget {
  const MealListItemTrait(
      {required this.iconData, required this.label, super.key});

  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(width: 1),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
