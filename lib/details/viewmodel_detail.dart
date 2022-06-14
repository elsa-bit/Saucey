import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:saucey/details/data_model_detail.dart';

class ViewModelDetail {
  static Future<DataClassTableDetail> fetchSpecialCocktail(String? id) async {
    final response = await http.get(Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id"));
    if (response.statusCode == 200) {
      return DataClassTableDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to download special cocktail');
    }
  }
}


