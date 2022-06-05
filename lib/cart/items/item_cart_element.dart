import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCartElement extends StatelessWidget {

  final String photo;
  final String name;
  final String category;
  final String price;

  const ItemCartElement({Key? key, required this.photo, required this.name, required this.category, required this.price}) : super(key: key);

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
                  margin: EdgeInsets.only(top: 40),
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
                ),
                Container(
                  padding: EdgeInsets.only(top: 45, left: 20),
                  child: Image.asset(
                      photo),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top:60, left: 70),
                      child:
                      Text(
                        name,
                        style: TextStyle(
                            fontFamily: 'AlegreyaSans',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      child:
                      Text(
                        category,
                        style: TextStyle(
                            fontFamily: 'AlegreyaSans',
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 70,left: 240),
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
          ],
        ),
      ),
    );
  }
}