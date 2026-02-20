class FoodItem {
  final String name;
  final String image;
  final String? priceSolo;
  final String? priceFries;
  final String? priceMenu;
  final String? price; // pour produits simples

  FoodItem({
    required this.name,
    required this.image,
    this.priceSolo,
    this.priceFries,
    this.priceMenu,
    this.price,
  });
}
