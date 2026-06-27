class District {
  const District({
    required this.name,
    required this.division,
    required this.description,
    required this.attractions,
    required this.rating,
    required this.imagePath,
    this.isFavorite = false,
  });

  final String name;
  final String division;
  final String description;
  final int attractions;
  final double rating;
  final String imagePath;
  final bool isFavorite;
}
