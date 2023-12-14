import 'package:demo_restaurant_app_widget/components/button.dart';
import 'package:demo_restaurant_app_widget/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget{
  const CartPage({super.key});
  //remove from cart
  void removeFromCart(Food food, BuildContext context){
    //access to the shop
    final shop = context.read<Shop>();
    //remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context){
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            title: const Text("My Cart"),
            elevation: 0,
            backgroundColor: primaryColor,
          ),
          body: Column(
            children: [
              //Customer cart
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index){
                    //get food from cart
                    final Food food = value.cart[index];
                    //get food's name
                    final String foodName = food.name;
                    //get food's price
                    final String foodPrice = food.price;
                    //return list tile
                    return Container(
                      decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(8)),
                      margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: ListTile(
                        title: Text(
                          foodName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Text(
                          foodPrice,
                          style: TextStyle(
                              color: Colors.grey[200],
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () => removeFromCart(food, context),
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey[300],
                            ),
                        ),
                      ),
                    );
                }),
              ),
              //Pay Button
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MyButton(text: "Pay Now ", onTap: (){}),
              )
            ],
          ),
        ),
    );
  }
}