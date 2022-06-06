import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saucey/cart/items/item_cart_element.dart';

import '../../utils/MyColors.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.black,
                  child: Image.asset(
                    'assets/images/barman.png',
                    fit: BoxFit.fitWidth,
                    color: Colors.white.withOpacity(0.8),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    'Ready to order ?',
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
          Container(
            width: double.infinity,
            height: 380,
            child: ListView.builder(
              itemBuilder: (context, index) => Container(
                width: double.infinity,
                height: 100,
                child: ItemCartElement(
                    photo: 'assets/images/red_cocktail.png',
                    name: 'Planter\'s Punch',
                    category: 'Tropical',
                    price: '15€'),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 46,
                  width: 380,
                  decoration: BoxDecoration(
                    color: MyColors.brown,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pay',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'AlegreyaSans',
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        Text(
                          '30,50€',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'AlegreyaSans',
                              fontSize: 18,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
