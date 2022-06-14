import '../data/cocktail_cart_repository.dart';
import '../model/cart_cocktail_model.dart';

class CartViewModel {
  static Future<bool> isAddedCocktailToCart(
      String? cocktailId, String? cocktailTitle, String? urlImage) async {
    bool _result = false;
    int _sizeOfFirstList = 0;
    bool _alreadyExist = false;
    int _newQuantity = 0;
    var listOfCocktails =
        await CocktailCartRepository.getAllCocktailsIntoDatabase();
    _sizeOfFirstList = listOfCocktails.length;
    for (var cocktail in listOfCocktails) {
      if (cocktailId == cocktail.id) {
        _alreadyExist = true;
        int _setQuantity = cocktail.quantity + 1;
        _newQuantity = _setQuantity;
        break;
      }
    }
    if (listOfCocktails.isEmpty || !_alreadyExist) {
      var quantity = 1;
      var setCocktailCart = CartCocktail(
          cocktailId!, cocktailTitle!, "N/A", urlImage, 15, quantity);
      CocktailCartRepository.addCocktailIntoDatabase(setCocktailCart);
    } else {
      var setCocktailCart = CartCocktail(
          cocktailId!, cocktailTitle!, "N/A", urlImage, 15, _newQuantity);
      CocktailCartRepository.updateCocktailIntoDatabase(setCocktailCart);
    }
    var newListOfCocktails =
        await CocktailCartRepository.getAllCocktailsIntoDatabase();
    if (_sizeOfFirstList < newListOfCocktails.length || _alreadyExist) {
      _result = true;
    } else {
      _result = false;
    }
    return _result;
  }
}
