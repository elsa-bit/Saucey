import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:saucey/cocktail/data_model_cocktail.dart';

class ViewModelCocktail {
  static Future<DataClassTableCocktail> fetchRandomCocktail() async {
    final response = await http.get(
        Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/random.php"));
    if (response.statusCode == 200) {
      print("response body : ${response.body}");
      return DataClassTableCocktail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to download random cocktail');
    }
  }

  /*static Future<List<DataClassCocktail>> fetchListOfRandomCocktails() async {
    List<DataClassCocktail> listOfCocktails = [];

    for (var i = 0; i <= 6; i++) {
      print("ici");
      DataClassCocktail oneCocktail = await fetchRandomCocktail();
      listOfCocktails.add(oneCocktail);
    }

    print("list of cocktails : $listOfCocktails");

    return listOfCocktails;
  }*/
}
