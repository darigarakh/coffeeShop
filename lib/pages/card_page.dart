import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});



  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void removeFromCard(Coffee coffee){
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCard(coffee);
  }
void payNow(){
  //depends on your payment type
}


  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading

              const Text(
                "Your Card",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              // list of card items
              Expanded(child: ListView.builder(itemCount: value.userCard.length, itemBuilder: (context, index) {
                
                Coffee eachCoffee = value.userCard[index];
                //get individual coffee cart items

                //return coffee
                return CoffeeTile(
                    coffee: eachCoffee,
                    onPressed: () => removeFromCard(eachCoffee),

                    icon: const Icon(Icons.delete));
              })),
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.brown, borderRadius: BorderRadius.circular(12)),
                  child: const Center(child: Text("Pay Now", style: TextStyle(color: Colors.white),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
