
import 'package:flutter/material.dart';
import 'package:store_app/presentation/widgets/bottom_navbar.dart';
import 'package:store_app/presentation/widgets/custom_button.dart';
import 'package:store_app/utils/consts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.bgColor,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
          Navigator.pop(context);
        },),
        backgroundColor: AppConstants.bgColor,
        automaticallyImplyLeading: false,
        title: Text("My Profile",style: AppConstants.headerTextStyle,),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "Welcome Rahul",
              style: AppConstants.headerTextStyle
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
             // Replace with your image asset
            ),
            SizedBox(height: 20),
            buildOption("Your Orders", Icons.shopping_bag),
            buildOption("Your Details", Icons.person),
            buildOption("About Us", Icons.info),
            buildOption("FAQ", Icons.help),
            buildOption("Your Discount Coupons", Icons.card_giftcard),
            CustomButton(buttonText: 'Logout',onPressed: (){},)
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget buildOption(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.white,),
        title: Text(title, style: AppConstants.bigTextStyle,),
        onTap: () {
          // Handle tap for each option
          // You can navigate to respective pages or perform actions here
          print("Tapped on $title");
        },
      ),
    );
  }
}