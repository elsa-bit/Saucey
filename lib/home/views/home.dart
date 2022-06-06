import 'package:flutter/material.dart';
import 'package:saucey/home/views/bottom_nav_bar.dart';
import 'package:saucey/cart/views/cart_cocktail.dart';
import 'package:saucey/category/views/category.dart';
import 'package:saucey/cocktail/cocktail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final screens = [
    Cocktail(),
    Category(),
    Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavBar(
        setIndexOfButton: (int value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
