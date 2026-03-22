import 'package:flutter/material.dart';
import 'package:the_brown/model/product_model.dart';

class ProductProvider extends ChangeNotifier {
 final List<ProductModel> _product = [
  // 🍵 MATCHA
  ProductModel(
    name: "Matcha Classic",
    size: "Small",
    price: 8,
    imagePath: "assets/image/matcha/matcha1.png",
    category: "matcha",
  ),
  ProductModel(
    name: "Matcha Latte",
    size: "Medium",
    price: 10,
    imagePath: "assets/image/matcha/matcha2.png",
    category: "matcha",
  ),
  ProductModel(
    name: "Iced Matcha",
    size: "Large",
    price: 12,
    imagePath: "assets/image/matcha/matcha3.png",
    category: "matcha",
  ),
  ProductModel(
    name: "Matcha Cream",
    size: "Medium",
    price: 11,
    imagePath: "assets/image/matcha/matcha4.png",
    category: "matcha",
  ),
  ProductModel(
    name: "Premium Matcha",
    size: "Large",
    price: 15,
    imagePath: "assets/image/matcha/matcha5.png",
    category: "matcha",
  ),

  // ☕ COFFEE
  ProductModel(
    name: "Espresso",
    size: "Small",
    price: 7,
    imagePath: "assets/image/coffee/coffee1.png",
    category: "coffee",
  ),
  ProductModel(
    name: "Americano",
    size: "Medium",
    price: 9,
    imagePath: "assets/image/coffee/coffee2.png",
    category: "coffee",
  ),
  ProductModel(
    name: "Cappuccino",
    size: "Large",
    price: 11,
    imagePath: "assets/image/coffee/coffee3.png",
    category: "coffee",
  ),
  ProductModel(
    name: "Latte",
    size: "Medium",
    price: 10,
    imagePath: "assets/image/coffee/coffee4.png",
    category: "coffee",
  ),
  ProductModel(
    name: "Mocha",
    size: "Large",
    price: 13,
    imagePath: "assets/image/coffee/coffee5.png",
    category: "coffee",
  ),

  // 🍃 TEA
  ProductModel(
    name: "Green Tea",
    size: "Small",
    price: 6,
    imagePath: "assets/image/tea/tea1.png",
    category: "tea",
  ),
  ProductModel(
    name: "Black Tea",
    size: "Medium",
    price: 7,
    imagePath: "assets/image/tea/tea2.png",
    category: "tea",
  ),
  ProductModel(
    name: "Milk Tea",
    size: "Large",
    price: 9,
    imagePath: "assets/image/tea/tea3.png",
    category: "tea",
  ),
  ProductModel(
    name: "Lemon Tea",
    size: "Medium",
    price: 8,
    imagePath: "assets/image/tea/tea4.png",
    category: "tea",
  ), 
  ProductModel(
    name: "Peach Tea",
    size: "Large",
    price: 10,
    imagePath: "assets/image/tea/tea5.png",
    category: "tea",
    
  ),
];
get products=> _product;
  final List<ProductModel> _addCart = [];
   
  get addToCart => _addCart;
 
  void addPToCart(ProductModel p){ 
    _addCart.add(p); 
     notifyListeners();
  }

  void removeFromCart(int index){
    addToCart.removeAt(index);
   notifyListeners(); 
  } 
  // int countItem = 0;
  // void itemCount(){ 
  // }
}
