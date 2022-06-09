import 'package:flutter/material.dart';
import 'package:saucey/utils/MyColors.dart';

class NoCocktailFound extends StatelessWidget {
  const NoCocktailFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset("assets/images/no_cocktail_found.png"),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Text(
            "No cocktail found",
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
