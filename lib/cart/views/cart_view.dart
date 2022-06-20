import 'package:flutter/material.dart';
import 'package:saucey/cart/data/cocktail_cart_repository.dart';
import 'package:saucey/cart/items/item_cart_element.dart';
import 'package:saucey/cart/model/cart_cocktail_model.dart';
import 'package:saucey/cart/view_model/cart_view_model.dart';
import 'package:saucey/utils/custom_views/no_cocktail_in_cart.dart';

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
              id: snapshot.data![index].id,
              photo: snapshot.data![index].cocktailUrlImage,
              name: snapshot.data![index].cocktailName,
              category: snapshot.data![index].cocktailCategory,
              price: snapshot.data![index].cocktailPrice.toString(),
              quantity: snapshot.data![index].quantity,
              callback: (bool isClicked) {
                if (isClicked) {
                  var cocktail = CartCocktail(
                      snapshot.data![index].id,
                      snapshot.data![index].cocktailName,
                      snapshot.data![index].cocktailCategory,
                      snapshot.data![index].cocktailUrlImage,
                      snapshot.data![index].cocktailPrice,
                      snapshot.data![index].quantity);
                  CocktailCartRepository.deleteCocktailIntoDatabase(cocktail);
                  setState(() {
                    futureListCardCocktail =
                        CocktailCartRepository.getAllCocktailsIntoDatabase();
                  });
                }
              },
            ),
          );
        },
      );
    }
  }

  _getTotalPrice(AsyncSnapshot<List<CartCocktail>> snapshot) {
    if (snapshot.data != null) {
      int _finalQuantity = 0;
      int _finalPrice = 0;
      for (var value in snapshot.data!) {
        _finalQuantity += value.quantity;
      }
      _finalPrice = _finalQuantity * 15;
      return Text(
        _finalPrice.toString() + " €",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'AlegreyaSans',
            fontSize: 18,
            color: Colors.white),
      );
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
              } else {
                if (snapshot.hasData) {
                  if (snapshot.data?.length != 0 &&
                      snapshot.data?.isNotEmpty == true) {
                    return _getListOfCocktailsCard(snapshot);
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 35.0),
                      child: NoCocktailFoundInCart(),
                    );
                  }
                }
              }
              return Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            },
          ),
        ),
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
                    TextButton(
                      onPressed: () {
                        var successToAdd = CartViewModel.isDeleteCart();
                        successToAdd.then((success) => {
                              if (success)
                                {
                                  setState(() {
                                    futureListCardCocktail =
                                        CocktailCartRepository
                                            .getAllCocktailsIntoDatabase();
                                  }),
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Accepted Paiement"),
                                    ),
                                  ),
                                }
                              else
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Refused Paiement"),
                                    ),
                                  ),
                                }
                            });
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                      ),
                      child: Container(
                        width: 354,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Pay",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'AlegreyaSans',
                                  color: Colors.white),
                            ),
                            FutureBuilder<List<CartCocktail>>(
                              future: futureListCardCocktail,
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  print('Error : ${snapshot.error}');
                                } else if (snapshot.hasData) {
                                  return _getTotalPrice(snapshot);
                                }
                                return Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
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
