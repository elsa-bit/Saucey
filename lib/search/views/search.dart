import 'package:flutter/material.dart';
import 'package:saucey/search/views/items/filter_button_search.dart';
import 'package:saucey/utils/MyColors.dart';
import 'package:saucey/utils/data_model_cocktail.dart';

import '../../utils/custom_views/item_card_cocktail.dart';
import '../viewmodel_search.dart';
import 'items/search_bar_search.dart';

class Search extends StatefulWidget {
  final String searchInfo;

  const Search({Key? key, required this.searchInfo}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late bool isLoading;
  final List<bool> _selectedStatus = [false, false, false];
  late Future<DataClassTableCocktail> _firstResult;

  @override
  void initState() {
    setState(() {
      isLoading = true;
      _firstResult = ViewModelSearch.searchForCocktail(widget.searchInfo);
    });
    super.initState();
  }

  gridViewOfCocktails(AsyncSnapshot<DataClassTableCocktail> snapshot) {
    if (snapshot.data != null) {
      return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.65)),
        itemCount: snapshot.data!.dataClassCocktail.length <= 10
            ? snapshot.data!.dataClassCocktail.length
            : 10,
        itemBuilder: (context, index) {
          return ItemCardCocktail(
            cocktailTitle: snapshot.data?.dataClassCocktail[index].nameCocktail,
            urlImage: snapshot.data?.dataClassCocktail[index].urlImage,
          );
        },
      );
    } else {
      return const Text("No cocktail exists.");
    }
  }

  /*gridViewOfCockTail2(List<DataClassCocktail> listOfCocktails) {
    if (listOfCocktails.isNotEmpty && isLoading == false) {
      return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.65)),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ItemCardCocktail(
            cocktailTitle: listOfCocktails[index].nameCocktail,
            urlImage: listOfCocktails[index].urlImage,
          );
        },
      );
    } else if (listOfCocktails.isEmpty && isLoading == false) {
      return const Text("Found no cocktail");
    } else {
      return CircularProgressIndicator();
    }
  }*/

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
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: MyColors.bordeaux,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Expanded(
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
            padding:
                const EdgeInsets.only(bottom: 15, right: 15, left: 15, top: 25),
            child: SearchBarFromSearch(
              inputFromCocktail: widget.searchInfo,
              retrieveCocktailsData: (Future<DataClassTableCocktail> value) {
                setState(() {
                  _firstResult = value;
                });
              },
            ),
          ),
          /** Filter buttons **/
          Row(
            children: [
              FilterButtonSearch(
                setSelectedStatus: (bool value) {
                  setState(() {
                    _selectedStatus[0] = value;
                  });
                },
                isSelected: _selectedStatus[0],
                buttonName: "No-alcoholic",
              ),
              FilterButtonSearch(
                setSelectedStatus: (bool value) {
                  setState(() {
                    _selectedStatus[1] = value;
                  });
                },
                isSelected: _selectedStatus[1],
                buttonName: "By name",
              ),
              FilterButtonSearch(
                setSelectedStatus: (bool value) {
                  setState(() {
                    _selectedStatus[2] = value;
                  });
                },
                isSelected: _selectedStatus[2],
                buttonName: "By ingredient",
              )
            ],
          ),
          /** Item Card for future list **/
          /** Call api to parse information into cards of cocktails **/
          Flexible(
            child: FutureBuilder<DataClassTableCocktail>(
              future: _firstResult,
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
          ),
          /*Flexible(
            child: gridViewOfCockTail2(_resultFromSearch),
          ),*/
        ],
      ),
    );
  }
}
