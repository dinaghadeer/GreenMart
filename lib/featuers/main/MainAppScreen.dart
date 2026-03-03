import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenmart/core/utils/colors.dart';
import 'package:greenmart/featuers/explore/pages/HomeScreen.dart';

import '../Cart/page/CartScreen.dart';
import '../Profile/AccountScreen.dart';
import '../explore/pages/FavoritesScreen.dart';
import '../explore/pages/SearchScreen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Only build the active screen
    Widget getCurrentScreen() {
      switch (currentIndex) {
        case 0:
          return const HomeScreen();
        case 1:
          return const SearchScreen();
        case 2:
          return const CartScreen();
        case 3:
          return const FavoritesScreen();
        case 4:
          return const AccountScreen();
        default:
          return const HomeScreen();
      }
    }

    return Scaffold(
      body: getCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.darkColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

