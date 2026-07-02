import '../../featuers/models/procucts.dart';
import '../../featuers/models/product_model.dart';

class FavoritesManager {
  static final List<Products> _favorites = [];

  static List<Products> get favorites => _favorites;

  static void add(Products product) {
    if (!_favorites.contains(product)) _favorites.add(product);
  }

  static void remove(Products product) {
    _favorites.remove(product);
  }
}