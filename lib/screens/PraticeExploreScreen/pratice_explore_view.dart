import 'package:fitme/models/coach.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/models/workout.dart';

abstract class PraticeExploreView {
  void loadAllCoaches(List<Coach> listCoach);
  void loadPosts(List<Post> listPosts);
  void showEmptyList();
  void loadAllWorkout(List<Workout> listWorkout);
  void refesh();
  void showFailedModal(String message);
}
