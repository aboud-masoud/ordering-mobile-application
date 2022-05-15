import 'package:talabat_ordering_system/models/item_model.dart';

class MainModel {
  String name;
  String imgName;
  int badgeCount;
  bool isSelected;
  List<Item> items;

  MainModel({required this.name, required this.imgName, required this.badgeCount, this.items = const [], this.isSelected = false});
}
