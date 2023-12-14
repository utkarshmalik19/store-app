import 'package:flutter/material.dart';
import 'package:store_app/presentation/screens/cart_page.dart';
import 'package:store_app/presentation/screens/dashboard_page.dart';
import 'package:store_app/presentation/screens/profile_page.dart';
import 'package:store_app/utils/consts.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
           // Navigate to a new page based on the selected index
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;  
          }
      },
      unselectedItemColor: Colors.white,
      backgroundColor: AppConstants.bgColor,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
      ]);
  }
}