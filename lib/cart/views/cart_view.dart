import 'package:flutter/material.dart';
import 'package:saucey/cart/data/cocktail_cart_repository.dart';
import 'package:saucey/cart/items/item_cart_element.dart';
import 'package:saucey/cart/model/cart_cocktail_model.dart';

import '../../utils/MyColors.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late Future<List<CartCocktail>> futureListCardCocktail;

  _getListOfCocktailsCard(AsyncSnapshot<List<CartCocktail>> snapshot) {
    if (snapshot.data != null) {
      return ListView.builder(
        itemCount: snapshot.data?.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 100,
            child: ItemCartElement(
                photo: snapshot.data![index].cocktailUrlImage,
                name: snapshot.data![index].cocktailName,
                category: snapshot.data![index].cocktailCategory,
                price: snapshot.data![index].cocktailPrice.toString()),
          );
        },
      );
    } else {
      return Text("No cocktail chosen yet !");
    }
  }

  @override
  void initState() {
    super.initState();
    futureListCardCocktail =
        CocktailCartRepository.getAllCocktailsIntoDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /**
         * Banner image
         */
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
        /**
         * List of items
         */
        SizedBox(
            width: double.infinity,
            height: 380,
            child: FutureBuilder<List<CartCocktail>>(
              future: futureListCardCocktail,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('Error : ${snapshot.error}');
                  return const Text("An error occurs, try later.");
                } else if (snapshot.hasData) {
                  return _getListOfCocktailsCard(snapshot);
                }
                return Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              },
            )),
        /**
         * Payment info
         */
        Row(
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
      ],
    );
  }
}
