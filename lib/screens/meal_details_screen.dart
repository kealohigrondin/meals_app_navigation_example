import 'package:flutter/material.dart';
import 'package:meals_app_navigation_example/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({required this.meal, super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(meal.title)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(meal.imageUrl,
                  height: 300, width: double.infinity, fit: BoxFit.cover),
              const SizedBox(height: 20),
              Text('Ingredients',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer)),
              const SizedBox(height: 10),
              for (final ingredient in meal.ingredients)
                Text(ingredient,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
              const SizedBox(height: 15),
              Text('Ingredients',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer)),
              const SizedBox(height: 10),
              for (final step in meal.steps)
                Text(step,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground))
            ],
          ),
        ));
  }
}
