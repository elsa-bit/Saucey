import 'package:flutter/material.dart';

class ItemCartElement extends StatelessWidget {
  final String? photo;
  final String name;
  final String category;
  final String price;

  const ItemCartElement(
      {Key? key,
      required this.photo,
      required this.name,
      required this.category,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Container(
                  width: 350,
                  height: 77,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      //Rewrite the logic of the photo (can't be forced)
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Image.asset(photo!),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontFamily: 'AlegreyaSans',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              category,
                              style: TextStyle(
                                  fontFamily: 'AlegreyaSans',
                                  color: Colors.grey,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        child: Row(
                          children: [
                            Text(
                              price,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 50),
                              child: Icon(
                                Icons.remove_circle,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
