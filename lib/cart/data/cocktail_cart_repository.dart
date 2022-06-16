import 'package:saucey/cart/model/cart_cocktail_model.dart';

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

  static void updateCocktailIntoDatabase(CartCocktail cocktailToUpdate) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final cocktailDao = database.cartCocktailDao;
    await cocktailDao.updateCocktail(cocktailToUpdate);
  }

  static void deleteAllCocktailsIntoDatabase() async {
    final database =
    await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final cocktailDao = database.cartCocktailDao;
    await cocktailDao.deleteCocktail();
  }


  static void deleteCocktailIntoDatabase(CartCocktail cocktailToDelete) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final cocktailDao = database.cartCocktailDao;
    await cocktailDao.deleteCartCocktail(cocktailToDelete);
  }
}
