import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_navigation_example/providers/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class SettingsNotifier extends StateNotifier<Map<Filter, bool>> {
  SettingsNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false
        });

  void setAllSettings(Map<Filter, bool> filters) {
    state = filters;
  }

  void setSetting(Filter filter, bool isActive) {
    //spread current state, replace one filter with isActive
    state = {...state, filter: isActive};
  }
}

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, Map<Filter, bool>>(
        (ref) => SettingsNotifier());


final filteredMealsProvider = Provider((ref) {
  //tells flutter to re-execute this function when either providers are updated
  final settings = ref.watch(settingsProvider);
  final meals = ref.watch(mealsProvider);

  return meals.where((meal) {
      if (settings[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (settings[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (settings[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (settings[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
});