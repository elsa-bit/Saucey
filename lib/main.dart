import 'package:flutter/material.dart';
import 'package:saucey/detail_cocktail.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Detail(),
    );
  }
}