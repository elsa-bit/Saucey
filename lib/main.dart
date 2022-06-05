import 'package:flutter/material.dart';
import 'package:saucey/cart/views/cart_cocktail.dart';

import 'home/views/home.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Cart(),
    );
  }
}