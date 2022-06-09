import 'package:flutter/material.dart';
import 'package:saucey/utils/MyColors.dart';

class FilterButtonSearchSelected extends StatelessWidget {
  final String buttonName;

  const FilterButtonSearchSelected({
    Key? key,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: const BoxDecoration(
        color: MyColors.bordeaux,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }
}
