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
  final String alcoholic;
  final String urlImage;

  //final List<String?> listOfIngredients;

  const DataClassCocktail({
    required this.idCocktail,
    required this.nameCocktail,
    required this.alcoholic,
    required this.urlImage,
    //required this.listOfIngredients,
  });

  factory DataClassCocktail.fromJson(Map<String, dynamic> json) {
    // Create a list of ingredients from the data
    /*List<String?> setListOfIngredient(String? ing1, String? ing2, String? ing3,
        String? ing4, String? ing5, String? ing6, String? ing7) {
      var listOfIngredients = List.filled(1, ing1, growable: true);
      if (ing2 != null || ing2 != "") {
        listOfIngredients.add(ing2);
      }
      if (ing3 != null || ing3 != "") {
        listOfIngredients.add(ing3);
      }
      if (ing4 != null || ing4 != "") {
        listOfIngredients.add(ing4);
      }
      if (ing5 != null || ing5 != "") {
        listOfIngredients.add(ing5);
      }
      if (ing6 != null || ing6 != "") {
        listOfIngredients.add(ing6);
      }
      if (ing7 != null || ing7 != "") {
        listOfIngredients.add(ing7);
      }
      return listOfIngredients;
    }*/

    return DataClassCocktail(
      idCocktail: json['idDrink'],
      nameCocktail: json['strDrink'],
      alcoholic: json['strAlcoholic'],
      urlImage: json['strDrinkThumb'],
      /*listOfIngredients: setListOfIngredient(
          json['strIngredient1'],
          json['strIngredient2'],
          json['strIngredient3'],
          json['strIngredient4'],
          json['strIngredient5'],
          json['strIngredient6'],
          json['strIngredient7']),*/
    );
  }
}
