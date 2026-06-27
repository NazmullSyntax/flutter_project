import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.title.copyWith(fontSize: 20)),
        const SizedBox(height: 12),
        Text(description, style: AppTextStyles.subtitle.copyWith(height: 1.7)),
      ],
    );
  }
}
