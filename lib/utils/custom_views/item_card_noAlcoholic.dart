import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saucey/details/views/detail_cocktail.dart';

class ItemCardNoAlcoholic extends StatelessWidget {
  final String? cocktailTitle;
  final String? urlImage;
  final String? id;

  //final String? alcoholicTag;

  const ItemCardNoAlcoholic( {
    Key? key,
    required this.cocktailTitle,
    required this.urlImage,
    required this.id,
    //required this.alcoholicTag
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return Detail(id : id);
            },
          ),
        );
      },
      child: Padding(
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
                    ],
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
                        onPressed: () {},
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
      ),
    );
  }
}
