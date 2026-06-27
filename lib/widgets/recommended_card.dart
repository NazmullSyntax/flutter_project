import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/destination_model.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_text_styles.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    super.key,
    required this.destination,
  });

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 14,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(22)),
            child: Image.asset(
              destination.imagePath,
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(destination.name, style: AppTextStyles.destinationTitle),
                  const SizedBox(height: 6),
                  Text(destination.location, style: AppTextStyles.destinationSubtitle),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(destination.price, style: AppTextStyles.priceLabel),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: Color(0xFFFFC107)),
                          const SizedBox(width: 4),
                          Text(destination.rating.toStringAsFixed(1), style: AppTextStyles.destinationSubtitle),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(
              destination.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: destination.isFavorite ? AppColors.accent : AppColors.subtitle,
            ),
          )
        ],
      ),
    );
  }
}
