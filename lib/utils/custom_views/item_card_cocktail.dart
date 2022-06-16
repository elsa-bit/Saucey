import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saucey/cart/view_model/cart_view_model.dart';
import 'package:saucey/details/views/detail_cocktail.dart';
import 'package:saucey/utils/constants.dart';

class ItemCardCocktail extends StatelessWidget {
  final String? cocktailId;
  final String? cocktailTitle;
  final String? urlImage;

  const ItemCardCocktail({
    Key? key,
    required this.cocktailId,
    required this.cocktailTitle,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff8C0E13),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              /** Cocktail image with alcoholic indication **/
              Container(
                alignment: Alignment.center,
                width: 120,
                height: 90,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return Detail(id: cocktailId);
                        },
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      urlImage != null
                          ? Container(
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(35),
                                  child: Image.network(urlImage!),
                                ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(35),
                                  child: Image.asset(
                                      'assets/images/exemple_cocktail.png'),
                                ),
                              ),
                            ),
                      Align(
                        heightFactor: 5.6,
                        alignment: Alignment.bottomRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 50,
                            height: 15,
                            alignment: Alignment.center,
                            color: const Color(0xffFFAF9A),
                            child: Text(
                              "Alcoholic",
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              /** Cocktail title **/
              cocktailTitle != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          cocktailTitle!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontFamily: 'Prompt',
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 7, top: 15),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "N/A",
                          style: TextStyle(
                              fontFamily: 'Prompt',
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              /** Price and button to buy it **/
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "15€",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        if (cocktailId != null && cocktailTitle != null) {
                          var successToAdd =
                              CartViewModel.isAddedCocktailToCart(
                                  cocktailId!, cocktailTitle!, urlImage);
                          successToAdd.then((success) => {
                                if (success)
                                  {
                                    Constants.quantityAllCocktails += 1,
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Cocktail added to the cart"),
                                      ),
                                    ),
                                  }
                                else
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("The cocktail can't be added"),
                                      ),
                                    ),
                                  }
                              });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("A problem occurs, please try later "),
                            ),
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: 50,
                          padding: EdgeInsets.only(top: 3, bottom: 3),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Color(0xff8C0E13)),
                          child: Text(
                            "Buy it",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
