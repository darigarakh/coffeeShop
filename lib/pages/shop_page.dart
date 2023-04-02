import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
//add coffee to card
  void addToCard(Coffee coffee) {
    //add to card
    Provider.of<CoffeeShop>(context, listen: false).addItemToCard(coffee);
    //let user know it add been done successfully
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully added to card!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.coffeeShop[index];
                    return CoffeeTile(
                      coffee: eachCoffee,
                      icon: Icon(Icons.add),
                      onPressed: () => addToCard(eachCoffee),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
