import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saucey/details/data_model_detail.dart';
import 'package:saucey/details/viewmodel_detail.dart';
import 'package:saucey/utils/MyColors.dart';

class Detail extends StatefulWidget {
  String? id;

  Detail({Key? key, required this.id}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Future<DataClassTableDetail> futureCocktail;

  @override
  void initState() {
    super.initState();
    futureCocktail = ViewModelDetail.fetchSpecialCocktail(widget.id);
  }

  detailCocktail(AsyncSnapshot<DataClassTableDetail> snapshot) {
    var image = snapshot.data?.dataClassDetail[0].urlImage;
    var name = snapshot.data?.dataClassDetail[0].nameCocktail;
    var ing = snapshot.data?.dataClassDetail[0].ingredient;
    var inst = snapshot.data?.dataClassDetail[0].instruction;
    var alc = snapshot.data?.dataClassDetail[0].alcoholic;

    if (snapshot.data != null) {
      return Column(
        children: [
          Stack(
            children: [
              Container(
                child: ClipRRect(
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.network(image!),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 20, top: 70),
                  child: Image.asset('assets/images/fleche.png'),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 20,
                          width: 90,
                          decoration: BoxDecoration(
                            color: MyColors.beige,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              alc!,
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
                          name!,
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
                              color: MyColors.bordeaux,
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
                              ing!,
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
                                      color: MyColors.bordeaux,
                                      fontSize: 16),
                                ),
                              ),
                              CustomPaint(
                                size: Size(20, 20),
                                painter: MyPainter2(),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*0.9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      inst!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
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
                          color: MyColors.bordeaux,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
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
          ),
        ],
      );
    } else {
      return const Text("No cocktails available.");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: FutureBuilder<DataClassTableDetail>(
              future: futureCocktail,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('Error : ${snapshot.error}');
                  return const Text("An error occurs, try later.");
                } else if (snapshot.hasData) {
                  return detailCocktail(snapshot);
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ]
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
      ..color = MyColors.bordeaux
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
      ..color = MyColors.bordeaux
      ..strokeWidth = 2;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
