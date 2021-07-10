import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// part 'inventory_model.g.dart';

@HiveType()
class Inventory {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  Inventory({
    this.name,
    this.description,
  });
}

@override
int get typeId => 0;
addItem(Inventory item) async {
  var box = await Hive.openBox<Inventory>('inventory');

  box.add(item);

  // notifyListeners();
}
