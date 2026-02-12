import 'package:flutter/material.dart';
import 'package:menuapp/screens/restaurantmenu_screen.dart';


void main() {
  runApp(const MenuAPP());
}


class MenuAPP extends StatelessWidget {
  const MenuAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RestaurantMenuScreen(),
    );
  }
}
