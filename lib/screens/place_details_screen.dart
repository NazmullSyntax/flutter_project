import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/place_model.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:flutter_application_2/widgets/about_section.dart';
import 'package:flutter_application_2/widgets/action_buttons.dart';
import 'package:flutter_application_2/widgets/bottom_navigation.dart';
import 'package:flutter_application_2/widgets/gallery_widget.dart';
import 'package:flutter_application_2/widgets/history_section.dart';
import 'package:flutter_application_2/widgets/hero_image.dart';
import 'package:flutter_application_2/widgets/place_info_card.dart';
import 'package:flutter_application_2/widgets/safety_tips_card.dart';
import 'package:flutter_application_2/widgets/visitor_info_card.dart';

class PlaceDetailsScreen extends StatefulWidget {
  const PlaceDetailsScreen({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  int selectedNavIndex = 1;
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    setState(() => isFavorite = !isFavorite);
  }

  void _onNavigationSelected(int index) {
    setState(() => selectedNavIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final horizontalPadding = constraints.maxWidth >= 900 ? 40.0 : 20.0;
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: HeroImage(
                      place: widget.place,
                      isFavorite: isFavorite,
                      onBack: () => Navigator.of(context).maybePop(),
                      onFavoriteToggle: _toggleFavorite,
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          PlaceInfoCard(place: widget.place),
                          const SizedBox(height: kSectionSpacing),
                          AboutSection(title: 'About This Place', description: widget.place.about),
                          const SizedBox(height: kSectionSpacing),
                          HistorySection(title: 'Historical Background', description: widget.place.history),
                          const SizedBox(height: kSectionSpacing),
                          VisitorInfoCard(items: widget.place.visitorInfo),
                          const SizedBox(height: kSectionSpacing),
                          SafetyTipsCard(safetyTips: widget.place.safetyTips),
                          const SizedBox(height: kSectionSpacing),
                          GalleryWidget(images: widget.place.galleryImages),
                          const SizedBox(height: 32),
                          ActionButtons(
                            onSave: () {},
                            onDirections: () {},
                          ),
                          const SizedBox(height: 90),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomNavigation(
        selectedIndex: selectedNavIndex,
        onTap: _onNavigationSelected,
      ),
    );
  }
}
