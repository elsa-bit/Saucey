import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Detail extends StatelessWidget {
  Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/blue.jpg'),
        Container(
          height: 30,
          width: 80,
          decoration: new BoxDecoration(
            color: Colors.beige,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              new Text(
                'Alcoholic',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 17.0,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
