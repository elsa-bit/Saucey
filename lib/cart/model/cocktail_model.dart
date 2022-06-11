import 'package:floor/floor.dart';

@entity
class CartCocktail {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String cocktailName;
  final String cocktailCategory;
  final String cocktailUrlImage;
  final int cocktailPrice;

  CartCocktail(this.id, this.cocktailName, this.cocktailCategory,
      this.cocktailUrlImage, this.cocktailPrice);
}
