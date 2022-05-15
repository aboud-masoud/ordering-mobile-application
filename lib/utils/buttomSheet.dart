import 'package:flutter/material.dart';
import 'package:talabat_ordering_system/models/item_model.dart';

Future showOurCartModal(BuildContext context, List<Item> list) async {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
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
              height: 200,
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 120,
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
                                      //TODO}
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
                                      //TODO}
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
                    );
                  }),
            )
          ],
        );
      });
}
