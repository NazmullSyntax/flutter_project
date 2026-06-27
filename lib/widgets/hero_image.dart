import 'package:flutter/material.dart';
import '../models/place_model.dart';
import '../utils/app_colors.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
    required this.place,
    required this.isFavorite,
    required this.onBack,
    required this.onFavoriteToggle,
  });

  final Place place;
  final bool isFavorite;
  final VoidCallback onBack;
  final VoidCallback onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: place.name,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                place.heroImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withAlpha(56), Colors.transparent],
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 16,
              child: _CircleIconButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: onBack,
              ),
            ),
            Positioned(
              right: 16,
              top: 16,
              child: _CircleIconButton(
                icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                onTap: onFavoriteToggle,
                fillColor: isFavorite ? AppColors.accent : Colors.white,
                iconColor: isFavorite ? Colors.white : AppColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({
    required this.icon,
    required this.onTap,
    this.fillColor = Colors.white,
    this.iconColor = Colors.black,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color fillColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: fillColor,
      shape: const CircleBorder(),
      elevation: 4,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: iconColor, size: 20),
        ),
      ),
    );
  }
}
