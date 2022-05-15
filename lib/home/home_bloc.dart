import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:talabat_ordering_system/models/main_model.dart';

class HomeBloc {
  final storage = FlutterSecureStorage();

  List<Item> itemsInCartList = [];

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

  double calculatePrice() {
    var totalPrice = 0.0;
    for (var item in itemsInCartList) {
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
