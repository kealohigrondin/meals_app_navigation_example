import 'package:flutter/material.dart';
import 'package:meals_app_navigation_example/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem({required this.category, required this.onTap, super.key});

  final Category category;
  final void Function() onTap;
  final BorderRadius cardRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: cardRadius,
      child: Container(
        key: ObjectKey(category.id),
        decoration: BoxDecoration(
            borderRadius: cardRadius,
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        padding: const EdgeInsets.all(16),
        child: Text(category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      ),
    );
  }
}
