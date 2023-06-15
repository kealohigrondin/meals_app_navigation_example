import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_navigation_example/providers/settings_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  var _glutenFreeOnly = false;
  var _lactoseFreeOnly = false;
  var _vegetarianOnly = false;
  var _veganOnly = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(settingsProvider);

    _glutenFreeOnly = activeFilters[Filter.glutenFree]!;
    _lactoseFreeOnly = activeFilters[Filter.lactoseFree]!;
    _veganOnly = activeFilters[Filter.vegan]!;
    _vegetarianOnly = activeFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        // drawer: MainDrawer(onSelectScreen: (identifier) {
        //   Navigator.of(context).pop();
        //   if (identifier == 'meals') {
        //     Navigator.of(context).pop(); //also pop the settings screen
        //   }
        // }),//can navigate this way as well
        body: WillPopScope(
          onWillPop: () async {
            ref.read(settingsProvider.notifier).setAllSettings({
              Filter.glutenFree: _glutenFreeOnly,
              Filter.lactoseFree: _lactoseFreeOnly,
              Filter.vegan: _veganOnly,
              Filter.vegetarian: _vegetarianOnly,
            });
            return true; // pops the screen
          },
          child: Column(
            children: [
              SwitchListTile(
                value: _glutenFreeOnly,
                onChanged: (isChecked) {
                  setState(() {
                    _glutenFreeOnly = isChecked;
                  });
                },
                title: Text('Gluten-free',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Only include gluten-free meals',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                contentPadding: const EdgeInsets.all(8),
              ),
              SwitchListTile(
                value: _lactoseFreeOnly,
                onChanged: (isChecked) {
                  setState(() {
                    _lactoseFreeOnly = isChecked;
                  });
                },
                title: Text('Lactose free',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Only include lactose-free meals',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                contentPadding: const EdgeInsets.all(8),
              ),
              SwitchListTile(
                value: _veganOnly,
                onChanged: (isChecked) {
                  setState(() {
                    _veganOnly = isChecked;
                  });
                },
                title: Text('Vegan',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Only include vegan meals',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                contentPadding: const EdgeInsets.all(8),
              ),
              SwitchListTile(
                value: _vegetarianOnly,
                onChanged: (isChecked) {
                  setState(() {
                    _vegetarianOnly = isChecked;
                  });
                },
                title: Text('Vegetarian',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Only include vegetarian meals',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                contentPadding: const EdgeInsets.all(8),
              ),
            ],
          ),
        ));
  }
}
