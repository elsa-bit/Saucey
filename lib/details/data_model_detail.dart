class DataClassTableDetail {
  final List<DataClassDetail> dataClassDetail;

  const DataClassTableDetail({
    required this.dataClassDetail,
  });

  factory DataClassTableDetail.fromJson(Map<String, dynamic> json) {
    var list = json['drinks'] as List;
    List<DataClassDetail> cocktailList =
        list.map((e) => DataClassDetail.fromJson(e)).toList();
    return DataClassTableDetail(dataClassDetail: cocktailList);
  }
}

class DataClassDetail {
  final String idCocktail;
  final String alcoholic;
  final String nameCocktail;
  final String? ingredient1;
  final String? ingredient2;
  final String? ingredient3;
  final String? ingredient4;
  final String? ingredient5;
  final String? ingredient6;
  final String? ingredient7;
  final String urlImage;
  final String instruction;

  const DataClassDetail(
      {required this.idCocktail,
      required this.alcoholic,
      required this.nameCocktail,
      required this.ingredient1,
      required this.ingredient2,
      required this.ingredient3,
      required this.ingredient4,
        required this.ingredient5,
        required this.ingredient6,
        required this.ingredient7,
      required this.urlImage,
      required this.instruction});

  factory DataClassDetail.fromJson(Map<String, dynamic> json) {
    return DataClassDetail(
      idCocktail: json['idDrink'],
      alcoholic: json['strAlcoholic'],
      nameCocktail: json['strDrink'],
      ingredient1: json['strIngredient1'],
      ingredient2: json['strIngredient2'],
      ingredient3: json['strIngredient3'],
      ingredient4: json['strIngredient4'],
      ingredient5: json['strIngredient5'],
      ingredient6: json['strIngredient6'],
      ingredient7: json['strIngredient7'],
      urlImage: json['strDrinkThumb'],
      instruction: json['strInstructions'],
    );
  }
}
