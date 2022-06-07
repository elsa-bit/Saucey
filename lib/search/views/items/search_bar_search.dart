import 'package:flutter/material.dart';
import 'package:saucey/search/viewmodel_search.dart';
import 'package:saucey/utils/data_model_cocktail.dart';

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

  @override
  void initState() {
    _getInfoFromCocktail = widget.inputFromCocktail;
    _inputController.text = _getInfoFromCocktail;
    super.initState();
    _getCocktailFromResearch =
        ViewModelSearch.searchForCocktail(_getInfoFromCocktail);
    _getCocktailFromResearch.then((value) =>
        print("get value ${value.dataClassCocktail[0].nameCocktail}"));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: TextField(
              controller: _inputController,
              onChanged: (String value) {
                _getInfoFromCocktail = value;
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
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
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
                widget.retrieveCocktailsData(_getCocktailFromResearch);
                print("get value : $_getCocktailFromResearch");
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
    );
  }
}
