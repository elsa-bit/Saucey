import 'package:flutter/material.dart';
import 'package:saucey/category/views/special_category.dart';

class ItemCategoryCard extends StatelessWidget {
  final String urlImage;
  final String textCard;

  const ItemCategoryCard(
      {Key? key, required this.urlImage, required this.textCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return SpecialCategory(title: textCard);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  urlImage,
                  fit: BoxFit.contain,
                  color: Colors.white.withOpacity(0.4),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
            Container(
              width: 150,
              height: 150,
              alignment: Alignment.center,
              child: Text(
                textCard,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
