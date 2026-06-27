import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class SafetyTipsCard extends StatelessWidget {
  const SafetyTipsCard({
    super.key,
    required this.safetyTips,
  });

  final List<String> safetyTips;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Safety Tips', style: AppTextStyles.title.copyWith(fontSize: 20)),
          const SizedBox(height: 14),
          ...safetyTips.map((tip) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(31),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.check, color: AppColors.primary, size: 16),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(tip, style: AppTextStyles.subtitle.copyWith(color: AppColors.subtitle, height: 1.6)),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
