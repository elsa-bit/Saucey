import 'package:flutter/material.dart';
import 'package:saucey/customs/MyColors.dart';

import '../../bottom_nav_bar/BottomNavBar.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    color: Colors.black,
                    child: Image.asset(
                      'assets/images/barman.png',
                      fit: BoxFit.fitWidth,
                      color: Colors.white.withOpacity(0.8),
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      'Ready to order ?',
                      style: TextStyle(
                          height: 2.0,
                          fontFamily: 'AlegreyaSans',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                padding: EdgeInsets.only(top: 45, left: 15),
                                child: Image.asset(
                                    'assets/images/red_cocktail.png'),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 25),
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
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 25),
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
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 25),
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
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 46,
                    width: 380,
                    decoration: BoxDecoration(
                      color: MyColors.brown,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pay',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'AlegreyaSans',
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          Text(
                            '30,50€',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'AlegreyaSans',
                                fontSize: 18,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
