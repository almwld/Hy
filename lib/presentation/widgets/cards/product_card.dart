import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final double originalPrice;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.05),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: const Center(
                  child: Icon(Icons.medication, size: 40, color: AppColors.primary),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(description, style: GoogleFonts.cairo(fontSize: 12, color: AppColors.grey)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '${price.toStringAsFixed(0)} ريال',
                        style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: AppColors.primary),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${originalPrice.toStringAsFixed(0)} ريال',
                        style: GoogleFonts.cairo(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
