class DataClassTableAllDetails {
  final List<DataClassAllDetails> dataClassDetail;

  const DataClassTableAllDetails({
    required this.dataClassDetail,
  });

  factory DataClassTableAllDetails.fromJson(Map<String, dynamic> json) {
    var list = json['drinks'] as List;
    List<DataClassAllDetails> cocktailList =
    list.map((e) => DataClassAllDetails.fromJson(e)).toList();
    return DataClassTableAllDetails(dataClassDetail: cocktailList);
  }
}

class DataClassAllDetails {
  final String idCocktail;
  final String alcoholic;
  final String nameCocktail;
  final String ingredient;
  final String urlImage;
  final String instruction;

  const DataClassAllDetails({
    required this.idCocktail,
    required this.alcoholic,
    required this.nameCocktail,
    required this.ingredient,
    required this.urlImage,
    required this.instruction
  });

  factory DataClassAllDetails.fromJson(Map<String, dynamic> json) {
    return DataClassAllDetails(
      idCocktail: json['idDrink'],
      alcoholic: json['strAlcoholic'],
      nameCocktail: json['strDrink'],
      ingredient: json['strIngredient1'],
      urlImage: json['strDrinkThumb'],
      instruction: json['strInstructions'],
    );
  }
}