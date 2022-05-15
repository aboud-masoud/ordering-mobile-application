class Item {
  String name;
  String desc;
  String imgPath;
  double price;
  double discount;
  int qty;
  int qtyInStock;

  Item({
    required this.name,
    required this.desc,
    required this.imgPath,
    required this.price,
    required this.discount,
    this.qty = 0,
    this.qtyInStock = 1000,
  });
}
