import 'package:flutter/material.dart';
import 'package:saucey/utils/MyColors.dart';

class NoCocktailFoundInCart extends StatelessWidget {
  const NoCocktailFoundInCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset("assets/images/no_cocktail_cart.png"),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            "No cocktail \nin the cart",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Prompt",
                color: MyColors.brown,
                fontWeight: FontWeight.w600,
                fontSize: 32),
          ),
        ),
      ],
    );
  }
}
