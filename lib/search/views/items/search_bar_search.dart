import 'package:flutter/material.dart';
import 'package:saucey/cocktail/data_model_cocktail.dart';

import '../../viewmodel_search.dart';
import 'filter_button_search_not_selected.dart';
import 'filter_button_search_selected.dart';

class SearchBarFromSearch extends StatefulWidget {
  final String inputFromCocktail;
  final Function(Future<DataClassTableCocktail>) retrieveCocktailsData;

  const SearchBarFromSearch(
      {Key? key,
      required this.inputFromCocktail,
      required this.retrieveCocktailsData})
      : super(key: key);

  @override
  State<SearchBarFromSearch> createState() => _SearchBarFromSearchState();
}

class _SearchBarFromSearchState extends State<SearchBarFromSearch> {
  final _inputController = TextEditingController();
  late String _getInfoFromCocktail;
  late Future<DataClassTableCocktail> _getCocktailFromResearch;
  int _selectedItem = 0;

  @override
  void initState() {
    _getInfoFromCocktail = widget.inputFromCocktail;
    _inputController.text = _getInfoFromCocktail;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const _listOfFilterName = ["By name", "By ingredient"];
    return Center(
      child: Column(
        children: [
          /**
           * Search bar
           */
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: TextField(
                  controller: _inputController,
                  onChanged: (String value) {
                    setState(() {
                      _getInfoFromCocktail = value;
                    });
                  },
                  decoration: const InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      fillColor: Color(0xffF0F0F0),
                      filled: true,
                      hintStyle:
                          TextStyle(fontSize: 12.0, color: Color(0xffBABABA)),
                      hintText: 'Search for a cocktail...'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedItem == 0) {
                      _getCocktailFromResearch =
                          ViewModelSearch.searchForCocktail(
                              _getInfoFromCocktail);
                      widget.retrieveCocktailsData(_getCocktailFromResearch);
                    } else if (_selectedItem == 1) {
                      _getCocktailFromResearch =
                          ViewModelSearch.searchByIngredient(
                              _getInfoFromCocktail);
                      widget.retrieveCocktailsData(_getCocktailFromResearch);
                    }
                    FocusScope.of(context).unfocus();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    primary: const Color(0xff8C0E13),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.0),
                    child: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SizedBox(
              height: 40,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedItem = index;
                        });
                      },
                      child: Center(
                          child: _selectedItem == index
                              ? FilterButtonSearchSelected(
                                  buttonName: _listOfFilterName[index])
                              : FilterButtonSearchNotSelected(
                                  buttonName: _listOfFilterName[index])),
                    );
                  },
                  itemCount: _listOfFilterName.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
