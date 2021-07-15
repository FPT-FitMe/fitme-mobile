import 'package:fitme/models/coach.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/models/tag.dart';
import 'package:fitme/models/workout.dart';

abstract class PraticeExploreView {
  void loadAllCoaches(List<Coach> listCoach);
  void loadPosts(List<Post> listPosts);
  void loadAllWorkout(List<Workout> listWorkout);
  void loadAllTag(List<Tag> listTag);
  void loadWorkoutsByTag(List<Workout> listWorkout, Tag tag);
  void showEmptyList();
  void refesh();
  void showFailedModal(String message);
  void showEmptyListWorkoutTag(Tag tag);
  void loadFavouriteWorkouts(List<Workout> listWorkouts);
}
