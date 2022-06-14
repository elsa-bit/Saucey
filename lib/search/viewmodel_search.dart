import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:saucey/utils/data_model_cocktail.dart';

class ViewModelSearch {
  static Future<DataClassTableCocktail> searchForCocktail(
      String searchCocktail) async {
    final response = await http.get(Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$searchCocktail"));
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return DataClassTableCocktail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to download from the search');
    }
  }

  static Future<DataClassTableCocktail> searchByIngredient(
      String ingredient) async {
    final response = await http.get(Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=$ingredient"));
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return DataClassTableCocktail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to download from search by ingredient");
    }
  }
}
