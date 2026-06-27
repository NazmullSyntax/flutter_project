import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

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
          Text(title, style: AppTextStyles.title.copyWith(fontSize: 20)),
          const SizedBox(height: 12),
          Text(description, style: AppTextStyles.subtitle.copyWith(height: 1.7)),
        ],
      ),
    );
  }
}
