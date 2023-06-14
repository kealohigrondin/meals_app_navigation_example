import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({required this.onSelectScreen, super.key});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6)
            ])),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 20),
                Text('Meals App',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
              ],
            )),
        ListTile(
            leading: Icon(Icons.restaurant,
                size: 26, color: Theme.of(context).colorScheme.onBackground),
            onTap: () {
              onSelectScreen('meals');
            },
            title: Text('Meals',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground))),
        ListTile(
            leading: Icon(Icons.settings,
                size: 26, color: Theme.of(context).colorScheme.onBackground),
            onTap: () {
              onSelectScreen('settings');
            },
            title: Text('Settings',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground))),
      ],
    ));
  }
}
