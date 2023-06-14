import 'package:flutter/material.dart';
import 'package:meals_app_navigation_example/models/meal.dart';
import 'package:meals_app_navigation_example/widgets/meal_list_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({required this.meal, required this.onMealSelect, super.key});

  final Meal meal;
  final void Function(Meal meal) onMealSelect;

  String capitalizeText(String input) {
    return input[0].toUpperCase() + input.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge, //clips all content that overflows the shape
      elevation: 8,
      child: InkWell(
          onTap: () {
            onMealSelect(meal);
          },
          child: Stack(
            children: [
              FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow:
                              TextOverflow.ellipsis, //very long text tha...
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          MealListItemTrait(iconData: Icons.schedule, label: '${meal.duration} min.'),
                          MealListItemTrait(iconData: Icons.workspace_premium, label: capitalizeText(meal.complexity.name)),
                          MealListItemTrait(iconData: Icons.attach_money, label: capitalizeText(meal.affordability.name)),
                        ],)
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
