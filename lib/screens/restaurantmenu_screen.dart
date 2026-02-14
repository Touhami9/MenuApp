import 'package:flutter/material.dart';
import 'package:menuapp/models/food_model.dart';
import 'package:menuapp/widgets/food_card.dart';


class RestaurantMenuScreen extends StatefulWidget {
  const RestaurantMenuScreen({super.key});

  @override
  State<RestaurantMenuScreen> createState() =>
      _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  int selectedIndex = 0;

  static const String foodImg =
      "https://images.unsplash.com/photo-1600891964599-f61ba0e24092";

  final List<String> categories = [
    "Sandwichs",
    "Tacos",
    "Paninis",
    "Tex-Mex",
    "Barquettes",
    "Desserts",
    "Boissons",
    "Sauces",
    "Suppléments",
  ];

  late final Map<String, List<FoodItem>> menuData = {
    "Sandwichs": [
      FoodItem(name: "Kebab", price: "6.50 €", image: foodImg),
      FoodItem(name: "Américain", price: "6.50 €", image: foodImg),
      FoodItem(name: "Kefta", price: "6.50 €", image: foodImg),
      FoodItem(name: "Chicken", price: "7.50 €", image: foodImg),
      FoodItem(name: "Royal Steak", price: "7.50 €", image: foodImg),
      FoodItem(name: "Royal Kebab", price: "7.50 €", image: foodImg),
      FoodItem(name: "Bledard", price: "8.50 €", image: foodImg),
      FoodItem(name: "Campagnard", price: "6.50 €", image: foodImg),
      FoodItem(name: "Falafel", price: "6.50 €", image: foodImg),
    ],
    "Tacos": [
      FoodItem(name: "Le Classic", price: "7.50 €", image: foodImg),
      FoodItem(name: "L'Italiano", price: "9.50 €", image: foodImg),
      FoodItem(name: "Kirikou", price: "9.50 €", image: foodImg),
      FoodItem(name: "Végétarien", price: "8.00 €", image: foodImg),
      FoodItem(name: "Falafel", price: "8.00 €", image: foodImg),
      FoodItem(name: "Le Fermier", price: "9.50 €", image: foodImg),
    ],
    "Paninis": [
      FoodItem(name: "Kebab", price: "6.00 €", image: foodImg),
      FoodItem(name: "Steak", price: "6.00 €", image: foodImg),
      FoodItem(name: "Chicken", price: "6.00 €", image: foodImg),
      FoodItem(name: "Trois Fromages", price: "6.00 €", image: foodImg),
      FoodItem(name: "Nutella", price: "5.00 €", image: foodImg),
    ],
    "Tex-Mex": [
      FoodItem(name: "Chicken Wings (6)", price: "8.00 €", image: foodImg),
      FoodItem(name: "Nuggets (6)", price: "6.00 €", image: foodImg),
      FoodItem(name: "Tenders (6)", price: "8.00 €", image: foodImg),
      FoodItem(name: "Menu Enfant", price: "7.50 €", image: foodImg),
    ],
    "Barquettes": [
      FoodItem(name: "Frites", price: "3.00 €", image: foodImg),
      FoodItem(name: "Viande", price: "6.00 €", image: foodImg),
      FoodItem(name: "Calamar d'oignons", price: "6.00 €", image: foodImg),
    ],
    "Desserts": [
      FoodItem(name: "Tiramisu", price: "3.00 €", image: foodImg),
      FoodItem(name: "Pâtisserie Orientale", price: "2.00 €", image: foodImg),
    ],
    "Boissons": [
      FoodItem(name: "Canette 33cl", price: "1.80 €", image: foodImg),
      FoodItem(name: "Boisson 50cl", price: "3.00 €", image: foodImg),
      FoodItem(name: "Eau 33cl", price: "1.50 €", image: foodImg),
      FoodItem(name: "Red Bull", price: "3.00 €", image: foodImg),
      FoodItem(name: "Thé", price: "1.50 €", image: foodImg),
    ],
    "Sauces": [
      FoodItem(name: "Mayonnaise", price: "0.50 €", image: foodImg),
      FoodItem(name: "Ketchup", price: "0.50 €", image: foodImg),
      FoodItem(name: "Blanche", price: "0.50 €", image: foodImg),
      FoodItem(name: "Algérienne", price: "0.50 €", image: foodImg),
      FoodItem(name: "Andalouse", price: "0.50 €", image: foodImg),
      FoodItem(name: "Samouraï", price: "0.50 €", image: foodImg),
      FoodItem(name: "Curry", price: "0.50 €", image: foodImg),
    ],
    "Suppléments": [
      FoodItem(name: "Oeuf", price: "2.00 €", image: foodImg),
      FoodItem(name: "Cheddar", price: "2.00 €", image: foodImg),
      FoodItem(name: "Mozzarella", price: "2.00 €", image: foodImg),
      FoodItem(name: "Chèvre", price: "2.00 €", image: foodImg),
      FoodItem(
          name: "Galette Pomme de Terre",
          price: "2.00 €",
          image: foodImg),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final selectedCategory = categories[selectedIndex];
    final items = menuData[selectedCategory] ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
appBar: AppBar(
  elevation: 4,
  title: const Text(
    "Menu",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Image.asset(
        "1770927184067.png",
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
    ),
  ],
  backgroundColor: Colors.transparent, // nécessaire pour voir le gradient
  flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.white, Colors.black], // blanc → noir
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
),


      body: Stack(
  children: [
    /// Background Image
Center(
  child: SizedBox(
    width: 450,  // largeur de l'image
    height: 450, // hauteur de l'image
    child: Image.asset(
      "1770927184067.png",
      fit: BoxFit.cover, // adapte l'image dans la box
    ),
  ),
),


    /// Dark overlay (pour lisibilité)
    Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.4),
      ),
    ),

    /// Content
    Column(
      children: [
        const SizedBox(height: 10),

        /// Categories
SizedBox(
  height: 60, // plus compact
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    itemCount: categories.length,
    itemBuilder: (context, index) {
      final isSelected = selectedIndex == index;

      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          margin: const EdgeInsets.only(right: 12),
          padding: EdgeInsets.symmetric(
              horizontal: isSelected ? 22 : 16,
              vertical: isSelected ? 14 : 10),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFE53935)
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(25),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              categories[index],
              style: TextStyle(
                fontSize: isSelected ? 16 : 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ),
      );
    },
  ),
),




        const SizedBox(height: 20),

        /// Grid
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
              childAspectRatio: 1.65,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return FoodCard(items[index]);
            },
          ),
        ),
      ],
    ),
  ],
),

    );
  }
}
