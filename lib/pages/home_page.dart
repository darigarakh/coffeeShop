import 'package:coffee_shop_app/components/bottom_nav_bar.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:flutter/material.dart';
import 'card_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

final List<Widget> _pages = [
  const ShopPage(),
  const CartPage(),
  
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index!),
      ),
      body:_pages[_selectedIndex],
    );
  }
}
