import 'package:flutter/material.dart';
import 'package:saucey/utils/MyColors.dart';
import 'package:saucey/utils/custom_views/item_card_noAlcoholic.dart';

import '../../cocktail/data_model_cocktail.dart';
import '../../utils/custom_views/item_card_cocktail.dart';
import '../viewmodel_category.dart';

class SpecialCategory extends StatefulWidget {
  String title;

  SpecialCategory({Key? key, required this.title}) : super(key: key);

  @override
  State<SpecialCategory> createState() => _SpecialCategoryState();
}

class _SpecialCategoryState extends State<SpecialCategory> {
  late Future<DataClassTableCocktail> futureCocktail;
  late Future<DataClassTableCocktail> futureNoAlcoholic;

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
          );
        },
      );
    } else {
      return const Text("No cocktails for this category available.");
    }
  }

  gridViewOfCocktailsNoAlcoholic(AsyncSnapshot<DataClassTableCocktail> snapshot) {
    if (snapshot.data != null) {
      return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.65)),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ItemCardNoAlcoholic(
              cocktailTitle: snapshot.data?.dataClassCocktail[index].nameCocktail,
              urlImage: snapshot.data?.dataClassCocktail[index].urlImage,
              id : snapshot.data?.dataClassCocktail[index].idCocktail
          );
        },
      );
    } else {
      return const Text("No cocktails for this category available.");
    }
  }

  @override
  void initState() {
    super.initState();
    futureCocktail = ViewModelCocktail.fetchSpecialCategory(widget.title);
    futureNoAlcoholic = ViewModelCocktail.fetchNoAlcoholicCocktail();
  }

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
          widget.title == "Non Alcoholic" ?
          Flexible(
            child: FutureBuilder<DataClassTableCocktail>(
              future: futureNoAlcoholic,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('Error : ${snapshot.error}');
                  return const Text("An error occurs, try later.");
                } else if (snapshot.hasData) {
                  return gridViewOfCocktailsNoAlcoholic(snapshot);
                }
                return const CircularProgressIndicator();
              },
            ),
          ):Flexible(
            child: FutureBuilder<DataClassTableCocktail>(
              future: futureCocktail,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('Error : ${snapshot.error}');
                  return const Text("An error occurs, try later.");
                } else if (snapshot.hasData) {
                  return gridViewOfCocktails(snapshot);
                }
                return const CircularProgressIndicator();
              },
            ),
          )
        ],
      ),
    );
  }
}
