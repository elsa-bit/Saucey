import 'package:flutter/material.dart';
import 'package:saucey/items/search_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/logo/saucey_logo.png',
              height: 53,
              width: 53,
            ),
          ),
          const SearchBar(),
        ],
      )),
    );
  }
}
