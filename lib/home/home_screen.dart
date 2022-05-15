import 'package:flutter/material.dart';
import 'package:talabat_ordering_system/home/home_bloc.dart';
import 'package:talabat_ordering_system/utils/buttomSheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = HomeBloc();

  var fullname = "";

  @override
  void initState() {
    bloc.mainList[0].isSelected = true;

    bloc.storage.read(key: "username").then((value) {
      fullname = value!;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF6F9FA),
        body: SafeArea(
          child: Column(
            children: [
              _header(),
              _searchField(),
              _listOfCategories(),
              _listOfItems(),
            ],
          ),
        ),
        floatingActionButton: cartView(context));
  }

  InkWell? cartView(BuildContext context) {
    return bloc.itemsInCartList.length == 0
        ? null
        : InkWell(
            onTap: () async {
              await showOurCartModal(context, bloc.itemsInCartList);
            },
            child: Container(
              height: 57,
              width: MediaQuery.of(context).size.width - 30,
              decoration: const BoxDecoration(
                color: Color(0xff572D86),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 33,
                    width: 33,
                    decoration: const BoxDecoration(
                      color: Color(0xffC3D61B),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${bloc.itemsInCartList.length}",
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  ),
                  const Text(
                    "Items",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    width: 3,
                    height: 33,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  Text(
                    "\$ ${bloc.calculatePrice()}",
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          );
  }

  Widget _listOfItems() {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: bloc.mainList[0].isSelected == true ? bloc.mainList.length - 1 : 1,
          itemBuilder: (context, index) {
            if (bloc.mainList[0].isSelected) {
              index = index + 1;
            } else {
              index = bloc.getIndexOfItemSelected();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bloc.mainList[index].name,
                  style: const TextStyle(
                    color: Color(0xff341557),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                bloc.mainList[index].items.length > 0
                    ? SizedBox(
                        height: bloc.mainList[index].items.length * 150,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: bloc.mainList[index].items.length,
                            itemBuilder: (itemContext, itemIndex) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8, bottom: 8),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  height: 135,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        bloc.mainList[index].items[itemIndex].imgPath,
                                        width: 75,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              bloc.mainList[index].items[itemIndex].name,
                                              style: const TextStyle(
                                                color: Color(0xff341557),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2,
                                              child: Text(
                                                bloc.mainList[index].items[itemIndex].desc,
                                                style: const TextStyle(
                                                  color: Color(0xff341557),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 8,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 1.7,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    bloc.mainList[index].items[itemIndex].price.toString() + " JOD",
                                                    style: const TextStyle(
                                                      color: Color(0xffC3D61B),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 19,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      bloc.mainList[index].items[itemIndex].qty += 1;
                                                      bloc.itemsInCartList.add(bloc.mainList[index].items[itemIndex]);
                                                      setState(() {});
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
                                                        Icons.shop,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                    : const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text("No Item Avaliable",
                              style: TextStyle(
                                color: Color(0xff341557),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              )),
                        ),
                      )
              ],
            );
          }),
    );
  }

  Widget _listOfCategories() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Categorias",
                style: TextStyle(
                  color: Color(0xff0D1863),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Expanded(child: Container()),
              const Text(
                "Offers",
                style: TextStyle(
                  color: Color(0xffE0201A),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            ],
          ),
          SizedBox(
            height: 110,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bloc.mainList.length,
                itemBuilder: (ctx, index) {
                  return Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              bloc.resetCategorySelection();
                              bloc.mainList[index].isSelected = true;
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: bloc.mainList[index].isSelected ? const Color(0xff572D86) : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: const Offset(0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              width: 90,
                              height: 87,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/categories/${bloc.mainList[index].imgName}.png",
                                      width: 50,
                                    ),
                                    Expanded(child: Container()),
                                    Text(bloc.mainList[index].name, style: TextStyle(fontSize: 12, color: bloc.mainList[index].isSelected ? Colors.white : const Color(0xff0D1863)), maxLines: 2)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      bloc.mainList[index].badgeCount > 0
                          ? Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Color(0xffC3D61B),
                                ),
                                child: Center(
                                  child: Text(
                                    bloc.mainList[index].badgeCount.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              width: 20,
                              height: 20,
                            ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Container(
        color: Colors.white,
        height: 35,
        child: TextField(
            controller: TextEditingController(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              ),
              hintText: 'Search here',
              hintStyle: TextStyle(fontSize: 10.0, color: Color(0xffCCCDDF)),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            style: const TextStyle(fontSize: 10.0, height: 4, color: Colors.black54)),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Image.asset("assets/menuIcon.png"),
          const SizedBox(width: 20),
          Text(
            fullname,
            style: const TextStyle(color: Color(0xff341557), fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(child: Container()),
          Image.asset("assets/circle.png")
        ],
      ),
    );
  }
}
