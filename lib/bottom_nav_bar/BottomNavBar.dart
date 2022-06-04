import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Color(0xff8C0E13)),
        ),
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_bar,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.grid_view,
              ),
              label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: 'Cart'),
        ],
        unselectedItemColor: Color(0xff8C0E13),
        selectedItemColor: Color(0xffFFAF9A),
      ),
    );
  }
}
