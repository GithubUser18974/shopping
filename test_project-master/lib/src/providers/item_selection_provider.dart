import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/src/models/app_model.dart';

final itemSelectionProvider = ChangeNotifierProvider<ItemSelectionViewModel>(
  (ref) => ItemSelectionViewModel(),
);

class ItemSelectionViewModel extends ChangeNotifier {
  final List<AppModel> selectedList = [];

  addItems(List<AppModel> items) {
    for (AppModel item in items) {
      if (selectedList.contains(item)) {
        //Don;t do anything
      } else {
        selectedList.add(item);
      }
    }
    // selectedList.addAll(items);
  }

  removeItem(AppModel item) {
    selectedList.remove(item);
  }
}
