import 'package:flutter_riverpod/flutter_riverpod.dart';

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
