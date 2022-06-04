import 'package:flutter/material.dart';

class ItemCardCocktail extends StatelessWidget {
  const ItemCardCocktail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.4,
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
            Container(
              alignment: Alignment.center,
              width: 90,
              height: 90,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(35),
                        child: Image.asset('assets/exemple_cocktail.png'),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 70,
                      height: 20,
                      alignment: Alignment.center,
                      color: Color(0xffFFAF9A),
                      child: Text("Alcoholic"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
