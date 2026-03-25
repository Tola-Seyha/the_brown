import 'package:flutter/material.dart';
import 'package:the_brown/model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductModel> _product = [
    //  MATCHA
    ProductModel(
      name: "Matcha Classic", 
      size: "200g",
      price: 8,
      imagePath: "assets/image/matcha/matcha1.png",
      category: "matcha",
    ),
    ProductModel(
      name: "Matcha Latte",
      size: "200g",
      price: 10,
      imagePath: "assets/image/matcha/matcha2.png",
      category: "matcha",
    ),
    ProductModel(
      name: "Iced Matcha",
      size: "200g",
      price: 12,
      imagePath: "assets/image/matcha/matcha3.png",
      category: "matcha",
    ),
    ProductModel(
      name: "Matcha Cream",
      size: "200g",
      price: 11,
      imagePath: "assets/image/matcha/matcha4.png",
      category: "matcha", 
    ),
    ProductModel(
      name: "Premium Matcha",
      size: "200g",
      price: 15,
      imagePath: "assets/image/matcha/matcha5.png",
      category: "matcha",
    ),

    //  COFFEE
    ProductModel(
      name: "Espresso",
      size: "200g",
      price: 7,
      imagePath: "assets/image/coffee/coffee1.png",
      category: "coffee",
    ),
    ProductModel(
      name: "Americano",
      size: "200g",
      price: 9,
      imagePath: "assets/image/coffee/coffee2.png",
      category: "coffee",
    ),
    ProductModel(
      name: "Cappuccino",
      size: "200g",
      price: 11,
      imagePath: "assets/image/coffee/coffee3.png",
      category: "coffee",
    ),
    ProductModel(
      name: "Latte",
      size: "200g",
      price: 10,
      imagePath: "assets/image/coffee/coffee4.png",
      category: "coffee",
    ),
    ProductModel(
      name: "Mocha",
      size: "200g",
      price: 13,
      imagePath: "assets/image/coffee/coffee5.png",
      category: "coffee",
    ),

    // TEA
    ProductModel(
      name: "Green Tea",
      size: "200g",
      price: 6,
      imagePath: "assets/image/tea/tea1.png",
      category: "tea",
    ),
    ProductModel(
      name: "Black Tea",
      size: "200g",
      price: 7,
      imagePath: "assets/image/tea/tea2.png",
      category: "tea",
    ),
    ProductModel(
      name: "Milk Tea",
      size: "200g",
      price: 9,
      imagePath: "assets/image/tea/tea3.png",
      category: "tea",
    ),
    ProductModel(
      name: "Lemon Tea",
      size: "200g",
      price: 8,
      imagePath: "assets/image/tea/tea4.png",
      category: "tea",
    ),
    ProductModel(
      name: "Peach Tea",
      size: "200g",
      price: 10,
      imagePath: "assets/image/tea/tea5.png",
      category: "tea",
    ),
  ];
  get products => _product;
  final List<ProductModel> _addCart = [];
  int itemCount = 0;
  get addToCart => _addCart;

  final List<ProductModel> _favorites = [];
  int favoriteCount = 0;
  get favorites => _favorites;

  bool addPToCart(ProductModel p) {
    bool exists = _addCart.any((item) => item.name == p.name);
    if (exists) {
      return false;
    }
    _addCart.add(p);
    itemCount += p.quantity; 
    notifyListeners();
    return true;
  }

  void removeFromCart(int index) {
    itemCount -= _addCart[index].quantity;
    _addCart.removeAt(index);
    notifyListeners();
  }

  void updateQuantity(int index, int newQty) {
    if (newQty < 1) return;
    int diff = newQty - _addCart[index].quantity;
    _addCart[index].quantity = newQty;
    itemCount += diff;    
    notifyListeners();
  }

  void removeAll() {
    _addCart.clear();
    itemCount = 0;
    notifyListeners();
  }

  bool isFavorite(ProductModel p) {
    return _favorites.any((item) => item.name == p.name);
  }

  void toggleFavorite(ProductModel p) {
    bool exists = isFavorite(p);
    if (exists) {
      _favorites.removeWhere((item) => item.name == p.name);
      favoriteCount--;
    } else {
      _favorites.add(p);
      favoriteCount++;
    }
    notifyListeners();
  }

  void addToFavorites(ProductModel p) {
    if (!isFavorite(p)) {
      _favorites.add(p);
      favoriteCount++;
      notifyListeners();
    }
  }

  void removeFromFavorites(int index) {
    _favorites.removeAt(index);
    favoriteCount--;
    notifyListeners();
  }

  void removeAllFavorites() {
    _favorites.clear();
    favoriteCount = 0;
    notifyListeners();
  } 
}
