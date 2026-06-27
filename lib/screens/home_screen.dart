import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/destination_model.dart';
import 'package:flutter_application_2/models/place_model.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_text_styles.dart';
import 'package:flutter_application_2/widgets/bottom_navigation.dart';
import 'package:flutter_application_2/widgets/category_chip.dart';
import 'package:flutter_application_2/screens/place_details_screen.dart';
import 'package:flutter_application_2/widgets/destination_card.dart';
import 'package:flutter_application_2/widgets/recommended_card.dart';
import 'package:flutter_application_2/widgets/travel_tip_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _selectedCategoryIndex = 0;
  int _selectedNavIndex = 0;
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;
  late final TextEditingController _searchController;

  final List<Map<String, String>> _categories = [
    {'icon': '🏔', 'label': 'Mountains'},
    {'icon': '🏖', 'label': 'Beaches'},
    {'icon': '🏛', 'label': 'Heritage'},
    {'icon': '🚵', 'label': 'Adventure'},
  ];

  final List<Destination> _popularDestinations = const [
    Destination(name: "Cox's Bazar", location: 'Chittagong', price: '199', rating: 4.8, imagePath: 'assets/images/images/coxs.png'),
    Destination(name: 'Sajek Valley', location: 'Rangamati', price: '349', rating: 4.8, imagePath: 'assets/images/images/sajek.png'),
    Destination(name: 'Saint Martin', location: 'Cox\'s Bazar', price: '289', rating: 4.7, imagePath: 'assets/images/images/beach.png'),
    Destination(name: 'Ratargul', location: 'Sylhet', price: '189', rating: 4.6, imagePath: 'assets/images/images/ratargol.png'),
    Destination(name: 'Paharpur', location: 'Naogaon', price: '299', rating: 4.5, imagePath: 'assets/images/images/pahar.png'),
  ];

  final List<Destination> _recommendedDestinations = const [
    Destination(name: 'Paharpur', location: 'Naogaon', price: '299', rating: 4.5, imagePath: 'assets/images/images/pahar.png', isFavorite: true),
    Destination(name: 'Ratargul Swamp Forest', location: 'Sylhet', price: '189', rating: 4.6, imagePath: 'assets/images/images/ratargol.png'),
    Destination(name: 'Sajek Valley', location: 'Rangamati', price: '349', rating: 4.8, imagePath: 'assets/images/sajek_valley.jpg'),
    Destination(name: 'Kuakata Beach', location: 'Patuakhali', price: '259', rating: 4.4, imagePath: 'assets/images/images/beach.png'),
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
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
    _searchController.dispose();
    super.dispose();
  }

  void _onCategorySelected(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  void _onNavigationSelected(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      appBar: _buildAppBar(),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              const SizedBox(height: 24),
              _buildCategorySection(),
              const SizedBox(height: 24),
              _buildPopularDestinations(),
              const SizedBox(height: 24),
              _buildTravelTips(),
              const SizedBox(height: 24),
              _buildRecommendedSection(),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomNavigation(
        selectedIndex: _selectedNavIndex,
        onTap: _onNavigationSelected,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.background,
      centerTitle: false,
      toolbarHeight: 80,
      title: Row(
        children: const [
          Icon(Icons.explore_rounded, color: AppColors.primary, size: 28),
          SizedBox(width: 12),
          Text('DeshExplorer', style: AppTextStyles.appBarTitle),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_rounded, color: AppColors.text),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Explore by category', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              _categories.length,
              (index) {
                final category = _categories[index];
                return Padding(
                  padding: EdgeInsets.only(right: index == _categories.length - 1 ? 0 : 12),
                  child: CategoryChip(
                    icon: category['icon']!,
                    label: category['label']!,
                    selected: index == _selectedCategoryIndex,
                    onTap: () => _onCategorySelected(index),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPopularDestinations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Popular Destinations', style: AppTextStyles.sectionTitle),
            TextButton(
              onPressed: () {},
              child: const Text('View All', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _popularDestinations.map((destination) {
              return DestinationCard(
                destination: destination,
                onFavoriteTap: () {},
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => PlaceDetailsScreen(place: _createPlaceFromDestination(destination)),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Place _createPlaceFromDestination(Destination destination) {
    return Place(
      name: destination.name,
      location: destination.location,
      rating: destination.rating,
      reviewCount: 1540,
      distance: '12 km away',
      category: 'Top Destination',
      heroImage: destination.imagePath,
      about:
          '${destination.name} is a breathtaking spot known for its beautiful scenery and unforgettable experiences. Perfect for travelers looking to explore the local culture and nature.',
      history:
          'This destination has a long history of welcoming visitors from across the country and around the world, offering memorable moments and cultural insights.',
      visitorInfo: const [
        VisitorInfoItem(
          icon: Icons.access_time_outlined,
          title: 'Visiting Hours',
          value: '8:00 AM – 8:00 PM',
        ),
        VisitorInfoItem(
          icon: Icons.monetization_on_outlined,
          title: 'Entry Fee',
          value: '350 BDT/person',
        ),
        VisitorInfoItem(
          icon: Icons.wb_sunny_outlined,
          title: 'Best Season',
          value: 'October – March',
        ),
      ],
      safetyTips: const [
        'Carry enough water',
        'Follow local guidelines',
        'Keep your belongings secure',
      ],
      galleryImages: [
        destination.imagePath,
        'assets/images/images/lalbag.png',
        'assets/images/images/mas.png',
      ],
    );
  }

  Widget _buildTravelTips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Travel Tips', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 16),
        TravelTipCard(onTap: () {}),
      ],
    );
  }

  Widget _buildRecommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recommended for You', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 16),
        ..._recommendedDestinations.map((destination) => RecommendedCard(destination: destination)),
      ],
    );
  }
}

