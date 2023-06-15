import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_navigation_example/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]); //init state

  bool toggleMealFavoriteStatus(Meal m) {
    //can't call .add or .remove since we can't modify state directly, it has to be reassigned
    if (state.contains(m)) {
      //remove meal
      state = state.where((element) => element.id != m.id).toList();
      return false;
    } else {
      //add the new meal
      state = [...state, m];
      return true;
    }
  }
}

//return instance of the notifier to make it available in consumers
// tell it what notifier it's using and the type of data being provided
final favoritesProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
