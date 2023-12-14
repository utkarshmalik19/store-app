import 'package:flutter/material.dart';
import 'package:store_app/presentation/widgets/bottom_navbar.dart';
import 'package:store_app/utils/consts.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.bgColor,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title:
            Text("Fruits and Vegetables", style: AppConstants.headerTextStyle),
      ),
      backgroundColor: AppConstants.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      //Update spacing values later
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0),
                  itemCount: 16,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                            width: 200,
                            height: 150,
                            child: Image.asset("assets/images/basket.png")),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "Vegetable",
                                style: AppConstants.bigTextStyle,
                              ),
                            ),
                            Text('200',style: AppConstants.smallTextStyle,)
                          ],
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
