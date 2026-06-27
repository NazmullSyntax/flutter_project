class UserProfile {
  const UserProfile({
    required this.name,
    required this.email,
    required this.avatarPath,
    required this.savedTrips,
    required this.favorites,
    required this.reviews,
  });

  final String name;
  final String email;
  final String avatarPath;
  final int savedTrips;
  final int favorites;
  final int reviews;

  static const UserProfile example = UserProfile(
    name: 'Alex Thompson',
    email: 'alex.thompson@email.com',
    avatarPath: 'assets/images/images/logo.png',
    savedTrips: 24,
    favorites: 18,
    reviews: 42,
  );
}
