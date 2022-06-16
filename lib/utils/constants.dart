class Constants {
  static const String FROM_COCKTAIL_ACTIVITY = "fromCocktailActivity";
  static const String FROM_SEARCH_ACTIVITY = "fromSearchActivity";
  static int quantityAllCocktails = 0;

  static int getFinalPrice() {
    return quantityAllCocktails*15;
  }
}
