import 'package:flutter/material.dart';

class ItemCategoryCard extends StatelessWidget {
  const ItemCategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
            child: Image.asset(
              'assets/images/category_party.jpg',
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Coucou",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Prompt',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
