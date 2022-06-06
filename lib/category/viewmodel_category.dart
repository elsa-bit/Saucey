import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:saucey/cocktail/data_model_cocktail.dart';

class ViewModelCocktail {
  static Future<DataClassTableCocktail> fetchSpecialCategory(String title) async {
    final response = await http.get(Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$title"));
    if (response.statusCode == 200) {
      return DataClassTableCocktail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to download random cocktail');
    }
  }

  static Future<DataClassTableCocktail> fetchNoAlcoholicCocktail() async {
    final response = await http.get(Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"));
    if (response.statusCode == 200) {
      return DataClassTableCocktail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to download random cocktail');
    }
  }
}


