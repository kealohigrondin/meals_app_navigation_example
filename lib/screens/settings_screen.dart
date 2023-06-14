import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({required this.currentFilters, super.key});

  final Map<Filter, bool> currentFilters;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _glutenFreeOnly = false;
  var _lactoseFreeOnly = false;
  var _vegetarianOnly = false;
  var _veganOnly = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeOnly = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeOnly = widget.currentFilters[Filter.lactoseFree]!;
    _veganOnly = widget.currentFilters[Filter.vegan]!;
    _vegetarianOnly = widget.currentFilters[Filter.vegetarian]!;
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
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeOnly,
              Filter.lactoseFree: _lactoseFreeOnly,
              Filter.vegan: _veganOnly,
              Filter.vegetarian: _vegetarianOnly,
            });
            return false; //return false to avoid popping a second time
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
