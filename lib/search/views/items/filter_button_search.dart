import 'package:flutter/material.dart';
import 'package:saucey/utils/MyColors.dart';

class FilterButtonSearch extends StatelessWidget {
  final bool isSelected;
  final String buttonName;

  const FilterButtonSearch(
      {Key? key, required this.isSelected, required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isSelected == true) {
      /** State of the button when is selected **/
      return Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              buttonName,
              style: TextStyle(fontSize: 12),
            ),
          ),
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: MyColors.bordeaux,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
      );
    } else {
      /** State of the button when is not selected **/
      return Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              buttonName,
              style: TextStyle(fontSize: 12),
            ),
          ),
          style: TextButton.styleFrom(
            primary: MyColors.bordeaux,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: MyColors.bordeaux,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
      );
    }
  }
}
