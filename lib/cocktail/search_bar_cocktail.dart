import 'package:flutter/material.dart';
import 'package:saucey/search/views/search.dart';

class SearchBarFromCocktail extends StatelessWidget {
  const SearchBarFromCocktail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _inputController = TextEditingController();
    String? setValue;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: TextField(
              controller: _inputController,
              decoration: InputDecoration(
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
                setValue = _inputController.text;
                if (_inputController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Search(searchInfo: setValue!),
                    ),
                  );
                  _inputController.clear();
                  FocusScope.of(context).unfocus();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Filled the search"),
                    duration: const Duration(seconds: 1),
                  ));
                }
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
