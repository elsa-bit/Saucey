import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int) setIndexOfButton;

  const BottomNavBar({Key? key, required this.setIndexOfButton})
      : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedItem = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
      widget.setIndexOfButton(index);
    });
  }

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
              label: 'Cocktail'),
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
        currentIndex: _selectedItem,
        unselectedItemColor: Color(0xff8C0E13),
        selectedItemColor: Color(0xffFFAF9A),
        onTap: _onItemTapped,
      ),
    );
  }
}
