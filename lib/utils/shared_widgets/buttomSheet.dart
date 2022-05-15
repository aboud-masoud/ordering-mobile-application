import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talabat_ordering_system/models/item_model.dart';

Future showOurCartModal({required BuildContext context, required List<Item> list, required Function(String) onPressed, required Function(String) callBack2}) async {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return StreamBuilder<Object>(
            stream: refresh.stream,
            builder: (context, snapshot) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            onPressed("5alaas mn  al x");
                            Navigator.pop(context);
                          },
                          icon: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xff572D86),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        const Text(
                          "Cart",
                          style: TextStyle(color: Color(0xff572D86), fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Expanded(child: Container()),
                        const SizedBox(
                          width: 50,
                          height: 50,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                            child: Column(
                              children: [
                                Container(
                                  height: 110,
                                  child: Row(
                                    children: [
                                      Image.asset(list[index].imgPath),
                                      const SizedBox(width: 5),
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            list[index].name,
                                            style: const TextStyle(color: Color(0xff341557), fontSize: 20),
                                          ),
                                          Text(
                                            list[index].price.toString(),
                                            style: const TextStyle(color: Color(0xff341557), fontSize: 18, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      Container(
                                        width: 45,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Color(0xffE00000)),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                list[index].qty -= 1;

                                                if (list[index].qty == 0) {
                                                  list.removeAt(index);
                                                }

                                                if (list.isEmpty) {
                                                  callBack2("5alaas mn  al items delete");
                                                  Navigator.pop(context);
                                                }

                                                refresh.sink.add("event");
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              list[index].qty.toString(),
                                              style: const TextStyle(color: Color(0xff341557), fontSize: 10, fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                list[index].qty += 1;
                                                refresh.sink.add("event");
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.grey,
                                  width: MediaQuery.of(context).size.width,
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Text(
                          "Total Items",
                          style: TextStyle(color: Color(0xff341557), fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: Container()),
                        Text(
                          calculateTotal(list).toString(),
                          style: TextStyle(color: Color(0xff341557), fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Checkout",
                        style: TextStyle(color: Color(0xff341557), fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              );
            });
      });
}

StreamController<String> refresh = StreamController<String>.broadcast();

double calculateTotal(List<Item> list) {
  double totalPrice = 0.0;

  for (var item in list) {
    var total = item.qty * item.price;

    totalPrice += total;
  }

  return totalPrice;
}
