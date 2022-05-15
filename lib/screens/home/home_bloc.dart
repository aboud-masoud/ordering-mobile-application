import 'package:talabat_ordering_system/models/item_model.dart';
import 'package:talabat_ordering_system/models/main_model.dart';

class HomeBloc {
  List<MainModel> mainList = [
    MainModel(name: "All", imgName: "all", badgeCount: 0),
    MainModel(name: "Pizzas", imgName: "Pizzas", badgeCount: 1, items: [
      Item(
        name: "Pizza veloper",
        desc: "Lorem ipsum dolor sit amet, consetetur Lorem ipsum dolor sit amet, consetetur",
        imgPath: "assets/items/pizza1.png",
        price: 150,
        discount: 20,
      ),
      Item(
        name: "Pizza Cantos",
        desc: "Lorem ipsum dolor sit amet, consetetur Lorem ipsum dolor sit amet, consetetur",
        imgPath: "assets/items/pizza2.png",
        price: 70,
        discount: 0,
      ),
    ]),
    MainModel(name: "Burger", imgName: "Burger", badgeCount: 8, items: [
      Item(
        name: "Burger miau",
        desc: "Lorem ipsum dolor sit amet, consetetur Lorem ipsum dolor sit amet, consetetur",
        imgPath: "assets/items/burger.png",
        price: 150,
        discount: 20,
      ),
    ]),
    MainModel(name: "Sandwich", imgName: "Sandwich", badgeCount: 0),
    MainModel(name: "Desayuno", imgName: "Desayuno", badgeCount: 7),
    MainModel(name: "Brocheta", imgName: "Brocheta", badgeCount: 0),
  ];

  List<Item> getListOfItemWithQtyMoreThanZero() {
    List<Item> resuiltItem = [];

    for (var obj in mainList) {
      for (var item in obj.items) {
        if (item.qty > 0) {
          resuiltItem.add(item);
        }
      }
    }

    return resuiltItem;
  }

  int getQtyForAllItems() {
    int qty = 0;

    for (var main in mainList) {
      for (var item in main.items) {
        qty += item.qty;
      }
    }

    return qty;
  }

  double calculatePrice() {
    var totalPrice = 0.0;
    for (var item in getListOfItemWithQtyMoreThanZero()) {
      totalPrice += item.price;
    }

    return totalPrice;
  }

  void resetCategorySelection() {
    for (int i = 0; i < mainList.length; i++) {
      mainList[i].isSelected = false;
    }
  }

  int getIndexOfItemSelected() {
    for (int i = 0; i < mainList.length; i++) {
      if (mainList[i].isSelected) {
        return i;
      }
    }

    return 0;
  }
}
