

import 'package:demo_restaurant_app_widget/models/shop.dart';
import 'package:demo_restaurant_app_widget/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/intro_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => Shop(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/menu_page': (context) => const MenuPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}

