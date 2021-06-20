class Post {
  final int id;
  final String name;
  final String imageUrl;
  final int duration;
  final bool isFavorite;
  final bool isPremium;

  const Post({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.duration,
    required this.isFavorite,
    required this.isPremium,
  });
}
