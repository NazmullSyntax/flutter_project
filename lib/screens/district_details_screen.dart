import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/district_model.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_text_styles.dart';

class DistrictDetailsScreen extends StatelessWidget {
  const DistrictDetailsScreen({
    super.key,
    required this.district,
  });

  final District district;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: district.name,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(28)),
                    child: Image.asset(
                      district.imagePath,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withAlpha(230),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_rounded, color: AppColors.text),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withAlpha(230),
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border_rounded, color: AppColors.text),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: ListView(
                  children: [
                    Text(district.name, style: AppTextStyles.title.copyWith(fontSize: 28)),
                    const SizedBox(height: 8),
                    Text(district.division, style: AppTextStyles.subtitle.copyWith(color: AppColors.primary)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 18, color: Color(0xFFFFC107)),
                        const SizedBox(width: 6),
                        Text(district.rating.toStringAsFixed(1), style: AppTextStyles.label),
                        const SizedBox(width: 12),
                        Text('${district.attractions}+ Attractions', style: AppTextStyles.subtitle),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text('About the district', style: AppTextStyles.sectionTitle),
                    const SizedBox(height: 10),
                    Text(
                      district.description,
                      style: AppTextStyles.subtitle.copyWith(height: 1.6),
                    ),
                    const SizedBox(height: 20),
                    Text('Highlights', style: AppTextStyles.sectionTitle),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _buildHighlight('Cultural Tours'),
                        _buildHighlight('Local Cuisine'),
                        _buildHighlight('Historic Landmarks'),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Plan My Trip'),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlight(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(title, style: AppTextStyles.label.copyWith(color: AppColors.text)),
    );
  }
}
