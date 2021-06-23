class Meal {
  final int id;
  final String name;
  final String imageUrl;
  final int duration;
  final int cal;
  final bool isFavorite;
  final bool isPremium;
  final List<String> tag;

  const Meal(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.duration,
      required this.cal,
      required this.isFavorite,
      required this.isPremium,
      required this.tag});
}
