import '../../featuers/home/models/category_product_model.dart';

class FavoritesManager {
  static final List<ProductModel> _favorites = [];

  static List<ProductModel> get favorites => _favorites;

  static void add(ProductModel product) {
    if (!_favorites.contains(product)) _favorites.add(product);
  }

  static void remove(ProductModel product) {
    _favorites.remove(product);
  }
}