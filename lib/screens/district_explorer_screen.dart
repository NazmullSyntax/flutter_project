import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/district_model.dart';
import 'package:flutter_application_2/screens/district_details_screen.dart';
import 'package:flutter_application_2/screens/profile_screen.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_text_styles.dart';
import 'package:flutter_application_2/widgets/bottom_navigation.dart';
import 'package:flutter_application_2/widgets/division_header.dart';
import 'package:flutter_application_2/widgets/district_card.dart';
import 'package:flutter_application_2/widgets/filter_chip.dart';
import 'package:flutter_application_2/widgets/search_bar.dart' as custom_search;

class DistrictExplorerScreen extends StatefulWidget {
  const DistrictExplorerScreen({super.key});

  @override
  State<DistrictExplorerScreen> createState() => _DistrictExplorerScreenState();
}

class _DistrictExplorerScreenState extends State<DistrictExplorerScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _filters = ['Popular', 'Most Visited', 'All', 'Newest'];
  int _selectedFilterIndex = 2;
  int _selectedNavIndex = 1;

  final List<District> _allDistricts = const [
    District(
      name: 'Dhaka',
      division: 'Dhaka Division',
      description: 'Capital city with rich Mughal heritage and modern attractions.',
      attractions: 25,
      rating: 4.7,
      imagePath: 'assets/images/images/lalbag.png',
      isFavorite: true,
    ),
    District(
      name: 'Gazipur',
      division: 'Dhaka Division',
      description: 'Industrial hub with natural parks and historical sites.',
      attractions: 8,
      rating: 4.3,
      imagePath: 'assets/images/images/pahar.png',
    ),
    District(
      name: 'Narayanganj',
      division: 'Dhaka Division',
      description: 'Riverside city known for textile industry and heritage.',
      attractions: 6,
      rating: 4.2,
      imagePath: 'assets/images/images/coxs.png',
    ),
    District(
      name: 'Tangail',
      division: 'Dhaka Division',
      description: 'Famous for handloom sarees and natural beauty.',
      attractions: 10,
      rating: 4.5,
      imagePath: 'assets/images/images/sajek.png',
    ),
    District(
      name: 'Cox\'s Bazar',
      division: 'Chittagong Division',
      description: 'World\'s longest natural sandy beach.',
      attractions: 12,
      rating: 4.9,
      imagePath: 'assets/images/images/beach.png',
      isFavorite: true,
    ),
    District(
      name: 'Chittagong',
      division: 'Chittagong Division',
      description: 'Port city with hills and coastal attractions.',
      attractions: 18,
      rating: 4.6,
      imagePath: 'assets/images/images/lalbag.png',
    ),
    District(
      name: 'Bandarban',
      division: 'Chittagong Division',
      description: 'Highest peaks and stunning hill landscapes.',
      attractions: 15,
      rating: 4.8,
      imagePath: 'assets/images/images/pahar.png',
    ),
    District(
      name: 'Sylhet',
      division: 'Sylhet Division',
      description: 'Land of tea gardens and spiritual destinations.',
      attractions: 18,
      rating: 4.8,
      imagePath: 'assets/images/images/tea.png',
      isFavorite: true,
    ),
    District(
      name: 'Khulna',
      division: 'Khulna Division',
      description: 'Gateway to Sundarbans mangrove forest.',
      attractions: 14,
      rating: 4.5,
      imagePath: 'assets/images/images/sondorbon.png',
    ),
    District(
      name: 'Rajshahi',
      division: 'Rajshahi Division',
      description: 'Silk city with mango orchards and heritage.',
      attractions: 13,
      rating: 4.4,
      imagePath: 'assets/images/images/hotel.png',
    ),
  ];

  String get _searchText => _searchController.text.trim().toLowerCase();

  List<District> get _filteredDistricts {
    final matches = _allDistricts.where((district) {
      final districtName = district.name.toLowerCase();
      final divisionName = district.division.toLowerCase();
      return districtName.contains(_searchText) || divisionName.contains(_searchText);
    }).toList();

    if (_selectedFilterIndex == 0) {
      return matches.where((district) => district.isFavorite).toList();
    }
    if (_selectedFilterIndex == 1) {
      final visited = matches.toList();
      visited.sort((a, b) => b.attractions.compareTo(a.attractions));
      return visited;
    }
    if (_selectedFilterIndex == 3) {
      final newest = matches.toList();
      newest.shuffle();
      return newest;
    }
    return matches;
  }

  Map<String, List<District>> get _districtsByDivision {
    final grouped = <String, List<District>>{};
    for (final district in _filteredDistricts) {
      grouped.putIfAbsent(district.division, () => []).add(district);
    }
    return grouped;
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {});
  }

  void _onNavigationSelected(int index) {
    if (index == _selectedNavIndex) return;
    setState(() => _selectedNavIndex = index);
    if (index == 4) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProfileScreen()));
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('All Districts', style: AppTextStyles.appBarTitle),
            const SizedBox(height: 4),
            Text('64 Districts Found', style: AppTextStyles.subtitle),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list_rounded, color: AppColors.text),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 16),
            custom_search.SearchBar(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              onClear: _clearSearch,
              hintText: 'Search districts...',
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 48,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _filters.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return ExplorerFilterChip(
                    label: _filters[index],
                    selected: _selectedFilterIndex == index,
                    onTap: () => setState(() => _selectedFilterIndex = index),
                  );
                },
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: _filteredDistricts.isEmpty
                  ? _buildEmptyState()
                  : CustomScrollView(
                      slivers: _districtsByDivision.entries.map((entry) {
                        return SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              DivisionHeader(title: entry.key),
                              ...entry.value.map(
                                (district) => DistrictCard(
                                  district: district,
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => DistrictDetailsScreen(district: district),
                                      ),
                                    );
                                  },
                                  onFavoriteTap: () {},
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNavigation(
        selectedIndex: _selectedNavIndex,
        onTap: _onNavigationSelected,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off_rounded, size: 80, color: AppColors.subtitle),
            const SizedBox(height: 20),
            Text('No districts found.', style: AppTextStyles.title.copyWith(fontSize: 20)),
            const SizedBox(height: 12),
            Text(
              'Try a different search term or clear the search filter to see districts again.',
              style: AppTextStyles.subtitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _clearSearch,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
              child: const Text('Clear Search'),
            ),
          ],
        ),
      ),
    );
  }
}
