import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/src/providers/item_selection_provider.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final itemSelectionViewModel = ref.watch(itemSelectionProvider);
    final selectedItems = itemSelectionViewModel.selectedList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: ListView.separated(
        itemCount: selectedItems.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = selectedItems[index];
          return ListTile(
            title: Text(item.text),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                ref.read(itemSelectionProvider).removeItem(item);
              },
            ),
          );
        },
      ),
    );
  }
}
