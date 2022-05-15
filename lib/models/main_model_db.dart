import 'package:hive/hive.dart';

part 'main_model_db.g.dart';

@HiveType(typeId: 0)
class MainModelDB extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String imgName;

  @HiveField(2)
  final int badgeCount;

  @HiveField(3)
  final bool isSelected;

  @HiveField(4)
  final List<Item> items;

  MainModelDB({required this.name, required this.imgName, required this.badgeCount, this.items = const [], this.isSelected = false});
}

@HiveType(typeId: 1)
class Item extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String desc;
  @HiveField(2)
  String imgPath;
  @HiveField(3)
  double price;
  @HiveField(4)
  double discount;
  @HiveField(5)
  int qty;

  Item({
    required this.name,
    required this.desc,
    required this.imgPath,
    required this.price,
    required this.discount,
    this.qty = 0,
  });
}
