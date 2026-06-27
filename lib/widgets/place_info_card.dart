import 'package:flutter/material.dart';
import '../models/place_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class PlaceInfoCard extends StatelessWidget {
  const PlaceInfoCard({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                place.name,
                style: AppTextStyles.title.copyWith(fontSize: 28),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(place.category, style: AppTextStyles.label.copyWith(color: AppColors.primary)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(place.location, style: AppTextStyles.subtitle.copyWith(color: AppColors.subtitle)),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, size: 16, color: Color(0xFFFFC107)),
                  const SizedBox(width: 6),
                  Text('${place.rating}', style: AppTextStyles.label.copyWith(color: AppColors.text)),
                  const SizedBox(width: 6),
                  Text('(${place.reviewCount} reviews)', style: AppTextStyles.hint),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 16, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Text(place.distance, style: AppTextStyles.label.copyWith(color: AppColors.text)),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
