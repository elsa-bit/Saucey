import 'package:saucey/cart/model/cocktail_model.dart';

import 'config_database.dart';

class CocktailCartRepository {
  static void addCocktailIntoDatabase(CartCocktail cocktailToAdd) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final cocktailDao = database.cartCocktailDao;
    await cocktailDao.insertCocktail(cocktailToAdd);
  }

  static Future<List<CartCocktail>> getAllCocktailsIntoDatabase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final cocktailDao = database.cartCocktailDao;
    final data = cocktailDao.findAllCocktails();

    return data;
  }
}
