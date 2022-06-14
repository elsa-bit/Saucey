import 'package:flutter/material.dart';

class ItemCartElement extends StatelessWidget {
  final String? photo;
  final String name;
  final String category;
  final String price;
  final int quantity;

  const ItemCartElement(
      {Key? key,
      required this.photo,
      required this.name,
      required this.category,
      required this.price,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 15),
            child: Image.network(photo!),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'AlegreyaSans',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  maxLines: 1,
                ),
              ),
              Text(
                category,
                style: TextStyle(
                    fontFamily: 'AlegreyaSans',
                    color: Colors.grey,
                    fontSize: 12),
              ),
            ],
          ),
          Text(
            price + "€",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            quantity.toString(),
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Icon(
            Icons.remove_circle,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
