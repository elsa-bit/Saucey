
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  late Widget coucou;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index){
              if (index % 2 == 0) return SizedBox();
              return Container(
                height: 1,
                color: Colors.black,
              );
            },
            itemBuilder: (BuildContext context, int index){
              print("Building item $index");
              if (index % 2 == 0) return SizedBox();
              return coucou;
            }
        ),
      ),
    );
  }
}