import 'package:flutter/material.dart';
import 'package:menuapp/models/menuchef_model.dart';

class TacosBuilderSection extends StatefulWidget {
  const TacosBuilderSection({super.key});

  @override
  State<TacosBuilderSection> createState() => _TacosBuilderSectionState();
}

class _TacosBuilderSectionState extends State<TacosBuilderSection> {
  final ScrollController _scrollController = ScrollController();

  String? selectedSize;
  String? selectedMeat;
  String? selectedSauce;

final Map<String, double> sizePrices = {
  "L": 8.0,
  "XL": 10.0,
};

final Map<String, double> meatExtras = {
  "Mix viande": 2.0,
  "Cordon bleu": 1.0,
};

double get totalPrice {
  if (selectedSize == null) return 0;

  double price = sizePrices[selectedSize] ?? 0;

  if (selectedMeat != null) {
    price += meatExtras[selectedMeat] ?? 0;
  }

  return price;
}


final List<ChefMenu> chefMenus = [
  ChefMenu(
    name: "Menu Chef 1",
    size: "L",
    meat: "Poulet",
    sauce: "Fromagère",
  ),
  ChefMenu(
    name: "Menu Chef 2",
    size: "XL",
    meat: "Mix viande",
    sauce: "Algérienne",
  ),
  ChefMenu(
    name: "Menu Chef 3",
    size: "L",
    meat: "Steak",
    sauce: "Samouraï",
  ),
];


  final sizes = ["L", "XL"];

  final meats = [
    "Poulet",
    "Kebab",
    "Steak",
    "Cordon bleu",
    "Mix viande"
  ];

  final sauces = [
    "Fromagère",
    "Algérienne",
    "Samouraï",
    "Harissa",
    "Ketchup",
    "Mayonnaise"
  ];


void _selectChefMenu(ChefMenu menu) {
  setState(() {
    selectedSize = menu.size;
    selectedMeat = menu.meat;
    selectedSauce = menu.sauce;
  });

  // Scroll vers le haut
  _scrollController.animateTo(
    0,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeInOut,
  );

  // SnackBar
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("${menu.name} sélectionné ✔"),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          const Center(
            child: Text(
              "🌮 COMPOSE TON TACOS 🌮",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
            ),
          ),

          const SizedBox(height: 5),

          /// STEP 1
          _buildStepTitle("ÉTAPE 1 : CHOISIS LA TAILLE"),
          const SizedBox(height: 10),
          _buildChoiceChips(sizes, selectedSize, (value) {
            setState(() => selectedSize = value);
          }),

          const SizedBox(height: 30),

          /// STEP 2
          _buildStepTitle("ÉTAPE 2 : CHOISIS TA VIANDE"),
          const SizedBox(height: 10),
          _buildChoiceChips(meats, selectedMeat, (value) {
            setState(() => selectedMeat = value);
          }),

          const SizedBox(height: 30),

          /// STEP 3
          _buildStepTitle("ÉTAPE 3 : CHOISIS TA SAUCE"),
          const SizedBox(height: 10),
          _buildChoiceChips(sauces, selectedSauce, (value) {
            setState(() => selectedSauce = value);
          }),

          AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  padding: const EdgeInsets.all(18),
  margin: const EdgeInsets.symmetric(vertical: 20),
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [Colors.orangeAccent, Colors.redAccent],
    ),
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.red.withOpacity(0.4),
        blurRadius: 10,
        offset: const Offset(0, 5),
      )
    ],
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "Total",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) =>
            ScaleTransition(scale: animation, child: child),
        child: Text(
          "${totalPrice.toStringAsFixed(2)} €",
          key: ValueKey(totalPrice),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  ),
),

          /// CHEF MENUS
          const Center(
            child: Text(
              "🔥 MENUS DU CHEF 🔥",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
          ),

          const SizedBox(height: 20),

          ...chefMenus.map((menu) => _buildChefMenuCard(menu)).toList(),

          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildStepTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  Widget _buildChoiceChips(
      List<String> options,
      String? selectedValue,
      Function(String) onSelected,
      ) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: options.map((option) {
        final isSelected = selectedValue == option;

        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (_) => onSelected(option),
          selectedColor: Colors.orangeAccent,
          backgroundColor: Colors.white,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        );
      }).toList(),
    );
  }

Widget _buildChefMenuCard(ChefMenu menu) {
  return GestureDetector(
    onTap: () => _selectChefMenu(menu),
    child: Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.deepOrange, Colors.redAccent],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Text(
        menu.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
}