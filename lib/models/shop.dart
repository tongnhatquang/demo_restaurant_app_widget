import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier{
//food menu
  final List<Food> _foodMenu = [
    //salmon sushi
    Food(
        name: "Salmon Sushi",
        price: "22.00",
        imagePath: "lib/images/salmon.png",
        rating: "4.8"
    ),
    //tuna
    Food(
        name: "Tuna Sushi",
        price: "25.00",
        imagePath: "lib/images/tuna.png",
        rating: "4.7"
    ),
    //shrimp
    Food(
        name: "Shrimp Sushi",
        price: "20.00",
        imagePath: "lib/images/shrimp_sushi.png",
        rating: "4.5"
    ),
  ];
  //customer cart
  final List<Food>_cart = [];
  //getter method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;
  //add to cart
  void addToCart(Food foodItem, int quantity){
    for (int i = 0; i < quantity; i++){
      _cart.add(foodItem);
    }
    notifyListeners();
  }
  //remove from cart
  void removeFromCart(Food food){
    _cart.remove(food);
    notifyListeners();
  }
}