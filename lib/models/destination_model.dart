class Destination {
  const Destination({
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.imagePath,
    this.isFavorite = false,
  });

  final String name;
  final String location;
  final String price;
  final double rating;
  final String imagePath;
  final bool isFavorite;
}
