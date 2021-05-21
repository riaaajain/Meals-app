import 'package:flutter/material.dart';

import '../widgets/tab_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function _saveFilters;
  Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this._saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluttenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _gluttenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _gluttenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget._saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: TabDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                  'Glutten-Free',
                  'Only include glutten-free meals.',
                  _gluttenFree,
                  (newValue) {
                    setState(
                      () {
                        _gluttenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(
                  'Lactose-Free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
