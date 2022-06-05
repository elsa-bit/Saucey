import 'package:flutter/material.dart';
import 'package:saucey/bottom_nav_bar/BottomNavBar.dart';
import 'package:saucey/category/views/items/ItemCategoryCard.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20.0),
          children: [
            Center(
              child: ItemCategoryCard(
                  urlImage: 'assets/images/category_sparkling.jpeg',
                  textCard: 'Sparkling'),
            ),
            Center(
              child: ItemCategoryCard(
                  urlImage: 'assets/images/category_party.jpg',
                  textCard: 'Party'),
            ),
            Center(
              child: ItemCategoryCard(
                  urlImage: 'assets/images/category_tropical.jpeg',
                  textCard: 'Tropical'),
            ),
            Center(
              child: ItemCategoryCard(
                  urlImage: 'assets/images/category_famous.jpeg',
                  textCard: 'Famous'),
            ),
            Center(
              child: ItemCategoryCard(
                  urlImage: 'assets/images/category_no_alcoholic.jpeg',
                  textCard: 'No-alcoholic'),
            ),
            Center(
              child: ItemCategoryCard(
                  urlImage: 'assets/images/category_stylish.jpeg',
                  textCard: 'Stylish'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
