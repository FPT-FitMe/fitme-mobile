import 'package:dio/dio.dart';
import 'package:fitme/configs/http_service.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/repository/post_repository.dart';

class PostService implements PostRepository {
  Dio dio = new HttpService().dio;

  @override
  Future<List<Post>> getAllPosts() async {
    final response = await dio.get("/posts");
    return (response.data as List).map((post) => Post.fromJson(post)).toList();
  }
}
