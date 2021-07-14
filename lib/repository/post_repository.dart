import 'package:fitme/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> getAllPosts();
  Future<List<Post>> getAllPostsByCoach(int coachID);
}
