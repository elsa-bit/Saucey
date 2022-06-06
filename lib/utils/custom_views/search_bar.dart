import 'package:flutter/material.dart';
import 'package:saucey/utils/constants.dart';

class SearchBar extends StatelessWidget {
  final String fromWhichActivity;

  const SearchBar({Key? key, required this.fromWhichActivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 6,
            child: TextField(
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
                if (fromWhichActivity == Constants.FROM_COCKTAIL_ACTIVITY) {
                  print("from cocktail activity");
                } else if (fromWhichActivity ==
                    Constants.FROM_SEARCH_ACTIVITY) {
                  print("from search activity");
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
