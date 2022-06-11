import 'package:saucey/cart/model/cocktail_model.dart';

import 'config_database.dart';

class CocktailCartViewModel {
  static Future<List<CartCocktail>> addCocktailIntoDatabase(CartCocktail cocktailToAdd) async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();


  }
}