import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/district_model.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_text_styles.dart';

class DistrictCard extends StatelessWidget {
  const DistrictCard({
    super.key,
    required this.district,
    required this.onTap,
    required this.onFavoriteTap,
  });

  final District district;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: district.name,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
                  child: Image.asset(
                    district.imagePath,
                    width: 120,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(district.name, style: AppTextStyles.title.copyWith(fontSize: 16)),
                        const SizedBox(height: 6),
                        Text(district.division, style: AppTextStyles.subtitle.copyWith(color: AppColors.primary)),
                        const SizedBox(height: 8),
                        Text(
                          district.description,
                          style: AppTextStyles.sectionSubtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text('${district.attractions}+ Attractions', style: AppTextStyles.label),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, size: 16, color: Color(0xFFFFC107)),
                                const SizedBox(width: 4),
                                Text(district.rating.toStringAsFixed(1), style: AppTextStyles.label),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: onFavoriteTap,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(10),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Icon(
                            district.isFavorite ? Icons.favorite : Icons.favorite_border,
                            size: 18,
                            color: district.isFavorite ? AppColors.accent : AppColors.subtitle,
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.subtitle, size: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
