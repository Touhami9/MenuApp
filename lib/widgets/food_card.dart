import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCard extends StatelessWidget {
  final String image;
  final String name;
  final String? priceSolo;
  final String? priceFries;
  final String? priceMenu;
  final String? price;

  const FoodCard({
    super.key,
    required this.image,
    required this.name,
    this.priceSolo,
    this.priceFries,
    this.priceMenu,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 6,
          shadowColor: Colors.orangeAccent.withOpacity(0.3),
          color: const Color.fromARGB(255, 39, 34, 32)
              .withOpacity(0.2), // background design
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                /// Image avec coins arrondis et ombre
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      image,
                      width: constraints.maxWidth * 0.45,
                      height: constraints.maxHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                /// Texte et prix
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                          height: 1.3,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(height: 6),

                      /// Gestion des prix
                      if (price != null)
                        Text(
                          price!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent.shade700,
                          ),
                        )
                      else ...[
                        if (priceSolo != null)
                          _buildPriceRow("Seul", priceSolo!),
                        if (priceFries != null)
                          _buildPriceRow("Frites", priceFries!),
                        if (priceMenu != null)
                          _buildPriceRow("Menu", priceMenu!),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPriceRow(String label, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 247, 4, 4),
            ),
          ),
        ],
      ),
    );
  }
}
