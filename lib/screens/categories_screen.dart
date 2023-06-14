import 'package:flutter/material.dart';
import 'package:meals_app_navigation_example/data/dummy_data.dart';
import 'package:meals_app_navigation_example/models/category.dart';
import 'package:meals_app_navigation_example/screens/meals_screen.dart';
import 'package:meals_app_navigation_example/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: dummyMeals
                  .where((meal) => meal.categories.contains(category.id))
                  .toList(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
                category: category,
                onTap: () {
                  _selectCategory(context, category);
                })
        ],
      ),
    );
  }
}
