import 'package:flutter/material.dart';
import 'package:menuapp/models/bgimage_model.dart';
import 'package:menuapp/models/category_model.dart';
import 'package:menuapp/models/food_model.dart';
import 'package:menuapp/widgets/blob.dart';
import 'package:menuapp/widgets/float_image.dart';
import 'package:menuapp/widgets/food_card.dart';

class RestaurantMenuScreen extends StatefulWidget {
  const RestaurantMenuScreen({super.key});

  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen>
    with TickerProviderStateMixin {
  int selectedIndex = 0;
  late AnimationController _floatController;

  static const String foodImg =
      "assets/images/bg2.png";

  List<FloatingBgImage> bgImages = [];

final List<Category> categories = [
  Category(name: "Sandwichs", icon: Icons.fastfood),
  Category(name: "Tacos", icon: Icons.local_pizza),
  Category(name: "Paninis", icon: Icons.lunch_dining),
  Category(name: "Tex-Mex", icon: Icons.restaurant_menu),
  Category(name: "Barquettes", icon: Icons.set_meal),
  Category(name: "Desserts", icon: Icons.icecream),
  Category(name: "Boissons", icon: Icons.local_drink),
  Category(name: "Sauces", icon: Icons.soup_kitchen),
  Category(name: "Suppléments", icon: Icons.add_circle),
];

  late final Map<String, List<FoodItem>> menuData = {
    "Sandwichs": [
      FoodItem(
        name: "Kebab",
        image: foodImg,
        priceSolo: "7.00 €",
        priceFries: "7.50 €",
        priceMenu: "8.00 €",
      ),
      FoodItem(
        name: "Américain",
        image: foodImg,
        priceSolo: "7.00 €",
        priceFries: "7.50 €",
        priceMenu: "8.00 €",
      ),
      FoodItem(
        name: "Kefta",
        image: foodImg,
        priceSolo: "7.00 €",
        priceFries: "7.50 €",
        priceMenu: "8.00 €",
      ),
      FoodItem(
        name: "Chicken",
        image: foodImg,
        priceSolo: "8.00 €",
        priceFries: "8.50 €",
        priceMenu: "9.00 €",
      ),
      FoodItem(
        name: "Royal Steak",
        image: foodImg,
        priceSolo: "8.00 €",
        priceFries: "8.50 €",
        priceMenu: "9.00 €",
      ),
      FoodItem(
        name: "Royal Kebab",
        image: foodImg,
        priceSolo: "8.00 €",
        priceFries: "8.50 €",
        priceMenu: "9.00 €",
      ),
      FoodItem(
        name: "Bledard",
        image: foodImg,
        priceSolo: "9.00 €",
        priceFries: "9.50 €",
        priceMenu: "10.00 €",
      ),
      FoodItem(
        name: "Campagnard",
        image: foodImg,
        priceSolo: "7.00 €",
        priceFries: "7.50 €",
        priceMenu: "8.00 €",
      ),
      FoodItem(
        name: "Falafel",
        image: foodImg,
        priceSolo: "7.00 €",
        priceFries: "7.50 €",
        priceMenu: "8.00 €",
      ),
    ],
    "Tacos": [
      FoodItem(
        name: "Le Classic",
        image: foodImg,
        priceSolo: "8.00 €",
        priceFries: "8.50 €",
        priceMenu: "9.00 €",
      ),
      FoodItem(
        name: "L'Italiano",
        image: foodImg,
        priceSolo: "10.00 €",
        priceFries: "10.50 €",
        priceMenu: "11.00 €",
      ),
      FoodItem(
        name: "Kirikou",
        image: foodImg,
        priceSolo: "10.00 €",
        priceFries: "10.50 €",
        priceMenu: "11.00 €",
      ),
      FoodItem(
        name: "Végétarien",
        image: foodImg,
        priceSolo: "8.50 €",
        priceFries: "9.00 €",
        priceMenu: "9.50 €",
      ),
      FoodItem(
        name: "Falafel",
        image: foodImg,
        priceSolo: "8.50 €",
        priceFries: "9.00 €",
        priceMenu: "9.50 €",
      ),
      FoodItem(
        name: "Le Fermier",
        image: foodImg,
        priceSolo: "10.00 €",
        priceFries: "10.50 €",
        priceMenu: "11.00 €",
      ),
    ],
    "Paninis": [
      FoodItem(
        name: "Kebab",
        image: foodImg,
        priceSolo: "6.50 €",
        priceFries: "7.00 €",
        priceMenu: "7.50 €",
      ),
      FoodItem(
        name: "Steak",
        image: foodImg,
        priceSolo: "6.50 €",
        priceFries: "7.00 €",
        priceMenu: "7.50 €",
      ),
      FoodItem(
        name: "Chicken",
        image: foodImg,
        priceSolo: "6.50 €",
        priceFries: "7.00 €",
        priceMenu: "7.50 €",
      ),
      FoodItem(
        name: "Trois Fromages",
        image: foodImg,
        priceSolo: "6.50 €",
        priceFries: "7.00 €",
        priceMenu: "7.50 €",
      ),
      FoodItem(
        name: "Nutella",
        image: foodImg,
        priceSolo: "5.50 €",
        priceFries: "6.00 €",
        priceMenu: "6.50 €",
      ),
    ],
    "Tex-Mex": [
      FoodItem(name: "Chicken Wings (6)", price: "8.50 €", image: foodImg),
      FoodItem(name: "Nuggets (6)", price: "6.50 €", image: foodImg),
      FoodItem(name: "Tenders (6)", price: "8.50 €", image: foodImg),
      FoodItem(name: "Menu Enfant", price: "8.00 €", image: foodImg),
    ],
    "Barquettes": [
      FoodItem(name: "Frites", price: "3.50 €", image: foodImg),
      FoodItem(name: "Viande", price: "6.50 €", image: foodImg),
      FoodItem(name: "Calamar d'oignons", price: "6.50 €", image: foodImg),
    ],
    "Desserts": [
      FoodItem(name: "Tiramisu", price: "3.50 €", image: foodImg),
      FoodItem(name: "Pâtisserie Orientale", price: "2.50 €", image: foodImg),
    ],
    "Boissons": [
      FoodItem(name: "Canette 33cl", price: "2.30 €", image: foodImg),
      FoodItem(name: "Boisson 50cl", price: "3.50 €", image: foodImg),
      FoodItem(name: "Eau 33cl", price: "2.00 €", image: foodImg),
      FoodItem(name: "Red Bull", price: "3.50 €", image: foodImg),
      FoodItem(name: "Thé", price: "2.00 €", image: foodImg),
    ],
    "Sauces": [
      FoodItem(name: "Mayonnaise", price: "1.00 €", image: foodImg),
      FoodItem(name: "Ketchup", price: "1.00 €", image: foodImg),
      FoodItem(name: "Blanche", price: "1.00 €", image: foodImg),
      FoodItem(name: "Algérienne", price: "1.00 €", image: foodImg),
      FoodItem(name: "Andalouse", price: "1.00 €", image: foodImg),
      FoodItem(name: "Samouraï", price: "1.00 €", image: foodImg),
      FoodItem(name: "Curry", price: "1.00 €", image: foodImg),
    ],
    "Suppléments": [
      FoodItem(name: "Oeuf", price: "2.50 €", image: foodImg),
      FoodItem(name: "Cheddar", price: "2.50 €", image: foodImg),
      FoodItem(name: "Mozzarella", price: "2.50 €", image: foodImg),
      FoodItem(name: "Chèvre", price: "2.50 €", image: foodImg),
      FoodItem(name: "Galette Pomme de Terre", price: "2.50 €", image: foodImg),
    ],
  };

  @override
  void initState() {
    super.initState();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      double screenWidth = MediaQuery.of(context).size.width;
      bgImages = [];
      for (var img in leftImages) {
        // côté gauche
        bgImages.add(img);
        // côté droit
        bgImages.add(FloatingBgImage(
          imagePath: img.imagePath,
          top: img.top,
          left: screenWidth - img.left! - img.width,
          width: img.width,
          height: img.height,
          opacity: img.opacity,
          dx: img.dx,
          dy: img.dy,
        ));
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

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
              "logo.png",
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
              colors: [Colors.white, Color.fromARGB(255, 40, 4, 2), Color.fromARGB(255, 27, 2, 1), Colors.black], // blanc → noir
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 54, 7, 7),
                  Color.fromARGB(255, 19, 19, 18),
                  Color.fromARGB(255, 27, 2, 1),
                ],
              ),
            ),
          ),

          /// Background Image
          LayoutBuilder(
            builder: (context, constraints) {
              final size = constraints.maxWidth * 0.6;

              return Center(
                child: SizedBox(
                  width: size,
                  height: size,
                  child: Image.asset(
                    "logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          // Blobs animés (coins)
// Top-left (déjà existant)
          buildBlob(
              top: -80,
              left: -80,
              controller: _floatController,
              color: Colors.orangeAccent.withOpacity(0.3)),

// Top-right
          buildBlob(
              top: -80,
              right: -80,
              controller: _floatController,
              color: Colors.blueAccent.withOpacity(0.25)),

// Bottom-left
          buildBlob(
              bottom: -80,
              left: -80,
              controller: _floatController,
              color: Colors.greenAccent.withOpacity(0.2)),

// Bottom-right (déjà existant)
          buildBlob(
              bottom: -80,
              right: -80,
              controller: _floatController,
              color: Colors.redAccent.withOpacity(0.2)),

          // Images flottantes
          for (var bg in bgImages)
            AnimatedBuilder(
              animation: _floatController,
              builder: (context, child) {
                return Positioned(
                  top: bg.top + bg.dy * _floatController.value,
                  left: bg.left! + bg.dx * _floatController.value,
                  child: Opacity(
                    opacity: bg.opacity,
                    child: Image.asset(
                      bg.imagePath,
                      width: bg.width,
                      height: bg.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
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
  height: 70,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    itemCount: categories.length,
    separatorBuilder: (_, __) => const SizedBox(width: 10),
    itemBuilder: (context, index) {
      final category = categories[index];
      final isSelected = selectedIndex == index;

      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Colors.orangeAccent, Colors.redAccent],
                  )
                : null,
            color: isSelected
                ? null
                : Colors.white.withOpacity(0.85),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                category.icon,
                size: 20,
                color: isSelected ? Colors.white : Colors.black54,
              ),
              const SizedBox(width: 6),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
                child: Text(category.name),
              ),
            ],
          ),
        ),
      );
    },
  ),
),


              const SizedBox(height: 20),

              /// Grid
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount;

                    if (constraints.maxWidth > 1100) {
                      crossAxisCount = 4;
                    } else if (constraints.maxWidth > 800) {
                      crossAxisCount = 3;
                    } else if (constraints.maxWidth > 500) {
                      crossAxisCount = 2;
                    } else {
                      crossAxisCount = 2;
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.6,
                      ),
itemCount: menuData[categories[selectedIndex].name]?.length ?? 0,
itemBuilder: (context, index) {
  final item = menuData[categories[selectedIndex].name]![index];
  return FoodCard(
    image: item.image,
    name: item.name,
    price: item.price,
    priceSolo: item.priceSolo,
    priceFries: item.priceFries,
    priceMenu: item.priceMenu,
  );
},

                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
