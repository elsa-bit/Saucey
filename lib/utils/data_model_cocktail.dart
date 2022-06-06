class DataClassTableCocktail {
  final List<DataClassCocktail> dataClassCocktail;

  const DataClassTableCocktail({
    required this.dataClassCocktail,
  });

  factory DataClassTableCocktail.fromJson(Map<String, dynamic> json) {
    var list = json['drinks'] as List;
    List<DataClassCocktail> cocktailList =
        list.map((e) => DataClassCocktail.fromJson(e)).toList();
    return DataClassTableCocktail(dataClassCocktail: cocktailList);
  }
}

class DataClassCocktail {
  final String idCocktail;
  final String nameCocktail;
  final String urlImage;

  const DataClassCocktail({
    required this.idCocktail,
    required this.nameCocktail,
    required this.urlImage,
  });

  factory DataClassCocktail.fromJson(Map<String, dynamic> json) {
    return DataClassCocktail(
      idCocktail: json['idDrink'],
      nameCocktail: json['strDrink'],
      urlImage: json['strDrinkThumb'],
    );
  }
}
