import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_text_styles.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
    required this.count,
    required this.label,
  });

  final int count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(8),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(count.toString(), style: AppTextStyles.title.copyWith(fontSize: 24)),
            const SizedBox(height: 8),
            Text(label, style: AppTextStyles.subtitle.copyWith(color: AppColors.subtitle)),
          ],
        ),
      ),
    );
  }
}
