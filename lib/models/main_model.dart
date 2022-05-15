class MainModel {
  String name;
  String imgName;
  int badgeCount;
  bool isSelected;
  List<Item> items;

  MainModel(
      {required this.name,
      required this.imgName,
      required this.badgeCount,
      this.items = const [],
      this.isSelected = false});
}

class Item {
  String name;
  String desc;
  String imgPath;
  double price;
  double discount;
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
