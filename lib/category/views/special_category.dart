import 'package:flutter/material.dart';
import 'package:saucey/utils/MyColors.dart';

import '../../utils/custom_views/item_card_cocktail.dart';

class SpecialCategory extends StatefulWidget {
  String title;

  SpecialCategory({Key? key, required this.title}) : super(key: key);

  @override
  State<SpecialCategory> createState() => _SpecialCategoryState();
}

class _SpecialCategoryState extends State<SpecialCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /** Toolbar with icon back **/
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 25.0, top: 40.0, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: MyColors.bordeaux,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Center(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          color: MyColors.bordeaux,
                          fontFamily: 'Prompt',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
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
      ),
    );
  }
}
