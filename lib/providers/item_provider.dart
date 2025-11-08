import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/item_model.dart';

class ItemProvider extends ChangeNotifier {
  late Box<ItemModel> _itemBox;
  List<ItemModel> _items = [];

  ItemProvider() {
    _itemBox = Hive.box<ItemModel>('items');
    loadItems();
  }

  List<ItemModel> get items => _items;

  void loadItems() {
    _items = _itemBox.values.toList();
    notifyListeners();
  }

  Future<void> addItem(String title, String description) async {
    final item = ItemModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      createdAt: DateTime.now(),
    );
    await _itemBox.put(item.id, item);
    loadItems();
  }

  Future<void> updateItem(String id, String title, String description) async {
    final item = _itemBox.get(id);
    if (item != null) {
      item.title = title;
      item.description = description;
      await item.save();
      loadItems();
    }
  }

  Future<void> deleteItem(String id) async {
    await _itemBox.delete(id);
    loadItems();
  }
}