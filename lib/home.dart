import 'package:flutter/material.dart';
import 'package:saucey/items/item_card_cocktail.dart';
import 'package:saucey/items/search_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //Top Logo
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Image.asset(
                  'assets/saucey_logo.png',
                  height: 53,
                  width: 53,
                ),
              ),
            ),
            //Search Bar
            const Padding(
              padding: EdgeInsets.only(bottom: 25, right: 15, left: 15),
              child: SearchBar(),
            ),
            //Image banner
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    color: Colors.black,
                    child: Image.asset(
                      'assets/home_verre_trinque.png',
                      fit: BoxFit.fitWidth,
                      color: Colors.white.withOpacity(0.4),
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Order on the app,\nCollect at the bar.',
                      style: TextStyle(
                          height: 2.0,
                          fontFamily: 'AlegreyaSans',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
            ItemCardCocktail(),
          ],
        ),
      ),
    );
  }
}
