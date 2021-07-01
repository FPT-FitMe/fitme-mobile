class Post {
  final int id;
  final String name;
  final String imageUrl;
  final String headline;
  final String content;
  final int duration;
  final int authorID;

  const Post({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.headline,
    required this.content,
    required this.duration,
    required this.authorID,
  });
}
