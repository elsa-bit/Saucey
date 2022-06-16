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
    var ing1 = snapshot.data?.dataClassDetail[0].ingredient1;
    var ing2 = snapshot.data?.dataClassDetail[0].ingredient2;
    var ing3 = snapshot.data?.dataClassDetail[0].ingredient3;
    var ing4 = snapshot.data?.dataClassDetail[0].ingredient4;
    var ing5 = snapshot.data?.dataClassDetail[0].ingredient5;
    var ing6 = snapshot.data?.dataClassDetail[0].ingredient6;
    var ing7 = snapshot.data?.dataClassDetail[0].ingredient7;
    var inst = snapshot.data?.dataClassDetail[0].instruction;
    var alc = snapshot.data?.dataClassDetail[0].alcoholic;


    //Rassembler tous les ingredients en une liste
    List<String> addIngredient = [];
    void testIngredient(String? ing){
      if(ing != null){
        addIngredient.add(ing);
      }
    }

    testIngredient(ing1);
    testIngredient(ing2);
    testIngredient(ing3);
    testIngredient(ing4);
    testIngredient(ing5);
    testIngredient(ing6);
    testIngredient(ing7);



    //Convertir la liste en String
    var detailResult = addIngredient.join(" // ");

    if (snapshot.data != null) {
      return Column(
        children: [
          Stack(
            children: [
              /**
               * Image du cocktail
               */
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
                    /**
                     * Button Alcoholic or No
                     */
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
                  /**
                   * Nom du cocktail
                   */
                  Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            name!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 24),
                          ),
                        )
                      ],
                    ),
                  ),
                  /**
                   * Prix
                   */
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "15€",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  /**
                   * Ingredients
                   */
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
                  Container(
                    width: double.infinity,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(1),
                            children: [
                              Text(detailResult)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  /**
                   * Etape de fabrication
                   */
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
                                height: 60,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 380,
                                      child: Text(
                                        inst!,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                        ),
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
                  /**
                   * Bouton d'achat
                   */
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
      body: Column(children: [
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
      ]),
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
