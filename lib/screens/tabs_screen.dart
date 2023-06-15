import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_navigation_example/providers/favorites_provider.dart';
import 'package:meals_app_navigation_example/providers/settings_provider.dart';
import 'package:meals_app_navigation_example/screens/categories_screen.dart';
import 'package:meals_app_navigation_example/screens/meals_screen.dart';
import 'package:meals_app_navigation_example/screens/settings_screen.dart';
import 'package:meals_app_navigation_example/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _activeTabIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _activeTabIndex = index;
    });
  }

  void _setScreenFromDrawer(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'settings') {
      //open settings
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const SettingsScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    //tells widget to watch for changes on filteredMealsProvider and use in meals variable
    final availableMeals = ref.watch(filteredMealsProvider);

    String activeScreenTitle = 'Categories';

    Widget activeScreen = CategoryScreen(
      availableMeals: availableMeals,
    );

    if (_activeTabIndex == 1) {
      final favoriteMeals = ref.watch(favoritesProvider);
      activeScreen = MealsScreen(
        meals: favoriteMeals,
      );
      activeScreenTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeScreenTitle)),
      body: activeScreen,
      drawer: MainDrawer(onSelectScreen: _setScreenFromDrawer),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectScreen(index);
        },
        currentIndex: _activeTabIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
