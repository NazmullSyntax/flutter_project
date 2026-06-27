import 'package:flutter/material.dart';

class VisitorInfoItem {
  const VisitorInfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;
}

class Place {
  const Place({
    required this.name,
    required this.location,
    required this.rating,
    required this.reviewCount,
    required this.distance,
    required this.category,
    required this.heroImage,
    required this.about,
    required this.history,
    required this.visitorInfo,
    required this.safetyTips,
    required this.galleryImages,
  });

  final String name;
  final String location;
  final double rating;
  final int reviewCount;
  final String distance;
  final String category;
  final String heroImage;
  final String about;
  final String history;
  final List<VisitorInfoItem> visitorInfo;
  final List<String> safetyTips;
  final List<String> galleryImages;

  static const Place lalbaghFort = Place(
    name: 'Lalbagh Fort',
    location: 'Dhaka, Bangladesh',
    rating: 4.8,
    reviewCount: 2847,
    distance: '12 km away',
    category: 'Historical Site',
    heroImage: 'assets/images/images/lalbag.png',
    about:
        'Lalbagh Fort is an incomplete Mughal fortress dating from the 17th century. This magnificent structure stands as a landmark of Bangladesh’s imperial past. The fort complex includes private residences, ornamental gardens, and domed gateways. Visitors can explore the elegant Mughal architecture and tranquil atmosphere while learning about the region’s cultural heritage.',
    history:
        'Construction of the fort began in 1678 during the reign of Prince Muhammad Azam. Soon after, the fort was abandoned and left incomplete after the death of its patron. Today, Lalbagh Fort remains one of Dhaka’s most iconic landmarks and offers a glimpse into Mughal-era craftsmanship, gardens, and defensive design.',
    visitorInfo: [
      VisitorInfoItem(
        icon: Icons.access_time_outlined,
        title: 'Visiting Hours',
        value: '8:00 AM – 6:00 PM',
      ),
      VisitorInfoItem(
        icon: Icons.monetization_on_outlined,
        title: 'Entry Fee',
        value: '500 BDT/person',
      ),
      VisitorInfoItem(
        icon: Icons.wb_sunny_outlined,
        title: 'Best Season',
        value: 'November – March',
      ),
      VisitorInfoItem(
        icon: Icons.timer_outlined,
        title: 'Duration',
        value: '2–3 Hours',
      ),
    ],
    safetyTips: [
      'Carry enough drinking water',
      'Respect local customs',
      'Keep valuables secure',
      'Follow designated pathways',
    ],
    galleryImages: [
      'assets/images/images/lalbag.png',
      'assets/images/images/dahka.png',
      'assets/images/images/mas.png',
      'assets/images/images/hotel.png',
    ],
  );
}
