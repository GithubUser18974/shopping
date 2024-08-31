import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/src/models/app_model.dart';
import 'package:test_project/src/providers/item_selection_provider.dart';
import 'package:test_project/src/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<AppModel> itemsList = [
    const AppModel(
      id: 0,
      text: 'List tile 1',
    ),
    const AppModel(
      id: 1,
      text: 'List tile name',
    ),
    const AppModel(
      id: 2,
      text: 'List tile name 2',
    ),
    const AppModel(
      id: 3,
      text: 'List tile name 3',
    ),
    const AppModel(
      id: 4,
      text: 'List tile',
    ),
    const AppModel(
      id: 5,
      text: 'List tile five',
    ),
    const AppModel(
      id: 6,
      text: 'List tile six',
    ),
    const AppModel(
      id: 7,
      text: 'List tile',
    ),
  ];

  final List<AppModel> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView.separated(
        itemCount: itemsList.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = itemsList[index];
          return ListTile(
            title: Text(item.text),
            leading: Checkbox(
              value: selectedItems.contains(item),
              onChanged: (newValue) {
                //TODO: Add logic here
                setState(() {
                  if (selectedItems.contains(item)) {
                    selectedItems.remove(item);
                  } else {
                    selectedItems.add(item);
                  }
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          return FloatingActionButton(
            onPressed: () {
              ref.read(itemSelectionProvider).addItems(selectedItems);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondScreen()),
              );
            },
            child: const Icon(Icons.navigate_next),
          );
        },
      ),
    );
  }
}
