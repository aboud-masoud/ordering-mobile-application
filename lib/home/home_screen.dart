import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    "Pizzas",
    "Burger",
    "Sandwich",
    "Desayuno",
    "Brocheta"
  ];

  String selectedCategory = "";

  @override
  void initState() {
    selectedCategory = categories[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            _searchField(),
            _listOfCategories(),
          ],
        ),
      ),
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
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          selectedCategory = categories[index];
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: selectedCategory == categories[index]
                                ? const Color(0xff572D86)
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          width: 70,
                          height: 85,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                    "assets/categories/${categories[index]}.png"),
                                Expanded(child: Container()),
                                Text(
                                  categories[index],
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          selectedCategory == categories[index]
                                              ? Colors.white
                                              : const Color(0xff0D1863)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
            style: const TextStyle(
                fontSize: 10.0, height: 4, color: Colors.black54)),
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
          InkWell(
            onTap: () {
              print("Mustafa");
              //TODO
            },
            child: Row(
              children: const [
                Text(
                  "Address : ",
                  style: TextStyle(color: Color(0xff9691AE), fontSize: 16),
                ),
                Text(
                  "Amman",
                  style: TextStyle(
                      color: Color(0xff341557),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_drop_down),
          Expanded(child: Container()),
          Image.asset("assets/circle.png")
        ],
      ),
    );
  }
}
