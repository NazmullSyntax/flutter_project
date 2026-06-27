import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_text_styles.dart';

class DivisionHeader extends StatelessWidget {
  const DivisionHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 24),
      child: Text(title, style: AppTextStyles.sectionTitle),
    );
  }
}
