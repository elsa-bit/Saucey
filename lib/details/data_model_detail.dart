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
  final String ingredient;
  final String urlImage;
  final String instruction;

  const DataClassDetail({
    required this.idCocktail,
    required this.alcoholic,
    required this.nameCocktail,
    required this.ingredient,
    required this.urlImage,
    required this.instruction
  });

  factory DataClassDetail.fromJson(Map<String, dynamic> json) {
    return DataClassDetail(
      idCocktail: json['idDrink'],
      alcoholic: json['strAlcoholic'],
      nameCocktail: json['strDrink'],
      ingredient: json['strIngredient1'],
      urlImage: json['strDrinkThumb'],
      instruction: json['strInstructions'],
    );
  }
}
