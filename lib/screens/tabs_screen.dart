import 'package:flutter/material.dart';
import 'package:meals_app_navigation_example/screens/categories_screen.dart';
import 'package:meals_app_navigation_example/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _activeTabIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _activeTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = const CategoryScreen();
    String activeScreenTitle = 'Categories';

    if (_activeTabIndex == 1) {
      activeScreen = const MealsScreen(meals: []);
      activeScreenTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeScreenTitle)),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectScreen(index);
        },
        currentIndex: _activeTabIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
