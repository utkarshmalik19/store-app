import 'package:flutter/material.dart';
import 'package:store_app/presentation/screens/category_page.dart';
import 'package:store_app/presentation/widgets/bottom_navbar.dart';
import 'package:store_app/presentation/widgets/item_tile.dart';
import 'package:store_app/utils/consts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> name = [
    "Lays",
    "Chupa Chups",
    "Amul cool",
    "Red Bull",
    "Thums Up",
    "Pepsi"
  ];
  List<String> categoriesImage = ['assets/images/food.png','assets/images/cold.png','assets/images/sweets.png','assets/images/spices.png','assets/images/vegetables.jpg','assets/images/cold.png','assets/images/sweets.png','assets/images/spices.png'];
  List<String> current = [];
  @override
  void initState() {
    current = name;
    super.initState();
  }

  void filter(String value) {
    List<String> newr = [];
    if (value.isEmpty) {
      newr = name;
    } else {
      newr = name
          .where((user) => user.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      current = newr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.bgColor,
      appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          backgroundColor: AppConstants.bgColor,
          title: Text(
            "General Store",
            style: AppConstants.headerTextStyle,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  onChanged: (value) => filter(value),
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      hintText: "Search Item",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Text(
                  "Browse By Categories",
                  style: AppConstants.bigTextStyle,
                ),
              ),
              SizedBox(
                height: 300,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      //Update spacing values later

                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        width: 200,
                        height: 200,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => CategoryPage()));
                            },
                            child: Image.asset(categoriesImage[index])));
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              current.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: current.length,
                      itemBuilder: (context, index) {
                        return ItemTile(
                            itemName: current[index],
                            itemDescription: current[index]);
                      })
                  : Text(
                      "No items found",
                      style: AppConstants.bigTextStyle,
                    )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
