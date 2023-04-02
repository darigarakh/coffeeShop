import 'package:coffee_shop_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier{
  final List<Coffee> _shop = [
    Coffee(
        name: 'Long Black',
        price: "4.10",
        imagePath: 'lib/images/blackcoffee.png'
    ),
        
    Coffee(
      name: 'Latte', 
      price: "4.20", 
      imagePath: 'lib/images/latte.png'
      ),
    Coffee(
        name: 'Espresso', 
        price: "4.00", 
         imagePath: 'lib/images/Espresso.png'
         ),
    Coffee(
        name: 'Cappuccino',
        price: '4.50',
        imagePath: 'lib/images/cappuccino.png'
        ),
  ];
  //coffee for sale
  List<Coffee> _userCard = [];
  //user card
  List<Coffee> get coffeeShop => _shop;

  //get coffee list

  //get user card
  List<Coffee> get userCard => _userCard;
  //add item to card
  void addItemToCard(Coffee coffee){
    _userCard.add(coffee);
    notifyListeners();
  }
  //remove item to card
  void removeItemFromCard(Coffee coffee){
    _userCard.remove(coffee);
    notifyListeners();
  }
}