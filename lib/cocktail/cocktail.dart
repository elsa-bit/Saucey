import 'package:flutter/material.dart';
import 'package:saucey/cocktail/search_bar_cocktail.dart';
import 'package:saucey/cocktail/viewmodel_cocktail.dart';

import '../utils/custom_views/item_card_cocktail.dart';
import '../utils/custom_views/no_cocktail_found.dart';
import 'data_model_cocktail.dart';

class Cocktail extends StatefulWidget {
  const Cocktail({Key? key}) : super(key: key);

  @override
  State<Cocktail> createState() => _CocktailState();
}

class _CocktailState extends State<Cocktail> {
  late Future<DataClassTableCocktail> futureCocktail;

  gridViewOfCocktails(AsyncSnapshot<DataClassTableCocktail> snapshot) {
    if (snapshot.data != null) {
      return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.65)),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ItemCardCocktail(
            cocktailId: snapshot.data?.dataClassCocktail[index].idCocktail,
            cocktailTitle: snapshot.data?.dataClassCocktail[index].nameCocktail,
            urlImage: snapshot.data?.dataClassCocktail[index].urlImage,
            id : snapshot.data?.dataClassCocktail[index].idCocktail
          );
        },
      );
    } else {
      return const Text("No cocktails available.");
    }
  }

  @override
  void initState() {
    super.initState();
    futureCocktail = ViewModelCocktail.fetchRandomCocktail();
  }

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
          child: SearchBarFromCocktail(),
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
        /** Call api to parse information into cards of cocktails **/
        Flexible(
          child: FutureBuilder<DataClassTableCocktail>(
            future: futureCocktail,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('Error : ${snapshot.error}');
                return const SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: NoCocktailFound(),
                  ),
                );
              } else if (snapshot.hasData) {
                return gridViewOfCocktails(snapshot);
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }
}
