import 'package:fitme/models/coach.dart';
import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/post.dart';

abstract class PraticeExploreView {
  void loadAllExercise(List<Exercise> listExercise);
  void loadAllCoaches(List<Coach> listCoach);
  void loadPosts(List<Post> listPosts);
  void showEmptyList();
}
