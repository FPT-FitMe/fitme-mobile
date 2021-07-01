class Meal {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final int duration;
  final int cal;
  final bool isFavorite;
  final bool isPremium;
  final List<String> tag;
  final List<String> ingredients;

  const Meal(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.description,
      required this.duration,
      required this.cal,
      required this.isFavorite,
      required this.isPremium,
      required this.tag,
      required this.ingredients});
}
