import 'package:floor/floor.dart';

@entity
class CartCocktail {
  @PrimaryKey(autoGenerate: false)
  final String id;
  final String cocktailName;
  final String cocktailCategory;
  final String? cocktailUrlImage;
  final int cocktailPrice;
  //final int quantity;

  CartCocktail(this.id, this.cocktailName, this.cocktailCategory,
      this.cocktailUrlImage, this.cocktailPrice);
}
