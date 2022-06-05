import 'package:flutter/material.dart';
import 'package:saucey/bottom_nav_bar/BottomNavBar.dart';
import 'package:saucey/category/views/items/ItemCategoryCard.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemCategoryCard(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
