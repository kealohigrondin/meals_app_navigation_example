import 'package:flutter/material.dart';
import 'package:meals_app_navigation_example/models/meal.dart';
import 'package:meals_app_navigation_example/widgets/meal_list_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({required this.title, required this.meals, super.key});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: meals.isNotEmpty
            ? ListView.builder(
                itemCount: meals.length,
                itemBuilder: (ctx, index) => MealListItem(meal: meals[index]))
            : Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text('No meals found',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground)),
                  const SizedBox(height: 10),
                  Text('Select a different category',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground))
                ]),
              ));
  }
}
