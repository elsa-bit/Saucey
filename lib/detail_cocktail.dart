import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Detail extends StatelessWidget {
  Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/blue.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 70),
                  child: Image.asset('assets/images/fleche.png'),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 20,
                          width: 66,
                          decoration: BoxDecoration(
                            color: Colors.beige,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            width: double.infinity,
                            child: Text(
                              'Alcoholic',
                              style:
                                  TextStyle(fontSize: 11, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Rosemary Blue",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 24),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "15,30€",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ingredients",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.bordeau,
                              fontSize: 16),
                        ),
                        CustomPaint(
                          size: Size(20, 20),
                          painter: MyPainter(),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gin",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "Blue Curacao",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 72,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rosemary",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "Tonic water",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 15,
                                child: Text(
                                  "How it's made ?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.bordeau,
                                      fontSize: 16),
                                ),
                              ),
                              CustomPaint(
                                size: Size(20, 20),
                                painter: MyPainter2(),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\u2022 Mettre des glacons",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    "\u2022 Mettre de la vodka",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    "\u2022 Rajouter le citron",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.bordeau,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                    width: double.infinity,
                    child: Text(
                      'Ajouter au panier',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white),
                    ),
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

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(-70, 25);
    final p2 = Offset(300, 25);
    final paint = Paint()
      ..color = Colors.bordeau
      ..strokeWidth = 2;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class MyPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(10, 10);
    final p2 = Offset(380, 10);
    final paint = Paint()
      ..color = Colors.bordeau
      ..strokeWidth = 2;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
