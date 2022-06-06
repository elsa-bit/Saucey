import 'package:flutter/material.dart';
import 'package:saucey/utils/custom_views/item_card_cocktail.dart';

import '../../utils/custom_views/search_bar.dart';

class Cocktail extends StatelessWidget {
  const Cocktail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /** Top Logo **/
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
        /** Search Bar **/
        const Padding(
          padding: EdgeInsets.only(bottom: 25, right: 15, left: 15),
          child: SearchBar(),
        ),
        /** Image Banner **/
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
                  'assets/images/home_verre_trinque.png',
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
        /** Item Card for future list **/
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.28)),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ItemCardCocktail();
            },
          ),
        ),
      ],
    );
  }
}
