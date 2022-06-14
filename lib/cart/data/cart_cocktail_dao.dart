import 'package:floor/floor.dart';
import 'package:saucey/cart/model/cart_cocktail_model.dart';

@dao
abstract class CocktailCartDao {
  @Query('SELECT * FROM CartCocktail')
  Future<List<CartCocktail>> findAllCocktails();

  @insert
  Future<void> insertCocktail(CartCocktail cartCocktail);

  @update
  Future<void> updateCocktail(CartCocktail cartCocktail);
}
