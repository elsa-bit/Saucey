import 'package:flutter/material.dart';
import 'package:saucey/search/views/items/filter_button_search.dart';
import 'package:saucey/utils/MyColors.dart';

import '../../bottom_nav_bar/BottomNavBar.dart';
import '../../home/views/items/item_card_cocktail.dart';
import '../../utils/custom_views/search_bar.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /** Toolbar with icon back **/
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 25.0, top: 40.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: MyColors.bordeaux,
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Center(
                    child: Text(
                      "Search for a cocktail",
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
          /** SearchBar **/
          Padding(
            padding: EdgeInsets.only(bottom: 15, right: 15, left: 15, top: 25),
            child: SearchBar(),
          ),
          /** Filter buttons **/
          Row(
            children: [
              FilterButtonSearch(
                isSelected: false,
                buttonName: "No-alcoholic",
              ),
              FilterButtonSearch(
                isSelected: false,
                buttonName: "By name",
              ),
              FilterButtonSearch(
                isSelected: false,
                buttonName: "By ingredient",
              )
            ],
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
