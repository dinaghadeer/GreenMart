import '../../featuers/models/procucts.dart';
import '../../featuers/models/product_model.dart';

class CartManager {
  static final Map<Products, int> _cartItems = {};

  /// Get all items in the cart
  static Map<Products, int> get cartItems => _cartItems;

  /// Add a single product to the cart (or increase quantity if already exists)
  static void add(Products product, {int quantity = 1}) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + quantity;
    } else {
      _cartItems[product] = quantity;
    }
  }

  /// Add a product multiple times (for your ProductDetailsScreen)
  static void addMultiple(Products product, int quantity) {
    add(product, quantity: quantity);
  }

  /// Add multiple products at once
  static void addAll(List<Products> products) {
    for (var product in products) {
      add(product);
    }
  }

  /// Remove a product
  static void remove(Products product) {
    _cartItems.remove(product);
  }

  /// Decrease quantity of a product (remove if quantity becomes 0)
  static void decrease(Products product, {int quantity = 1}) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! - quantity;
      if (_cartItems[product]! <= 0) {
        _cartItems.remove(product);
      }
    }
  }

  /// Clear the entire cart
  static void clear() => _cartItems.clear();

  /// Get total number of items
  static int get totalItems =>
      _cartItems.values.fold(0, (previous, quantity) => previous + quantity);

  /// Get total price
  static double get totalPrice =>
      _cartItems.entries
          .fold(0, (previous, entry) => previous + entry.key.price * entry.value);
}