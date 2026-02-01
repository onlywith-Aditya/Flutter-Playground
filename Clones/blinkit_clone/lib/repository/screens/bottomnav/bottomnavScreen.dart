import 'package:blinkit_clone/repository/screens/Cart/cartscreen.dart';
import 'package:blinkit_clone/repository/screens/Home/homescreen.dart';
import 'package:blinkit_clone/repository/screens/categories/categoryScreen.dart';
import 'package:blinkit_clone/repository/screens/print/printscreen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    CategoryScreen(),
    PrintScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/home.png"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/shopping-bag.png"),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/category.png"),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/printer.png"),
            label: "Print",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
