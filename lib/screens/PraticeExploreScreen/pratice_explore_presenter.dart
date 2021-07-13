import 'package:fitme/models/coach.dart';
// import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/repository/coach_repository.dart';
// import 'package:fitme/repository/exercise_repository.dart';
import 'package:fitme/di/injection.dart';
import 'package:fitme/repository/post_repository.dart';
import 'package:fitme/repository/workout_repository.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore_view.dart';

class PraticePresenter {
  PraticeExploreView _praticeExploreView;
  late CoachRepository _coachRepository;
  // late ExerciseRepository _exerciseRepository;
  late PostRepository _postRepository;
  late WorkoutRepository _workoutRepository;

  PraticePresenter(this._praticeExploreView) {
    // _exerciseRepository = new Injector().exerciseRepository;
    _coachRepository = new Injector().coachRepository;
    _postRepository = new Injector().postRepository;
    _workoutRepository = new Injector().workoutRepository;
  }

  Future<void> getAllWorkouts() async {
    try {
      List<Workout> listWorkout = await _workoutRepository.getAllWorkout();
      print(listWorkout);
      _praticeExploreView.loadAllWorkout(listWorkout);
    } catch (e) {
      _praticeExploreView.showEmptyList();
      print(e);
    }
  }

  // void loadAllExercise() async {
  //   try {
  //     List<Exercise> listExercise = await _exerciseRepository.getAllExercises();
  //     _praticeExploreView.loadAllExercise(listExercise);
  //   } catch (e) {
  //     _praticeExploreView.showEmptyList();
  //     print(e);
  //   }
  // }

  void loadAllCoaches() async {
    try {
      List<Coach> listCoaches = await _coachRepository.getAllCoaches();
      _praticeExploreView.loadAllCoaches(listCoaches);
    } catch (e) {
      print(e);
    }
  }

  void loadAllPosts() async {
    // try {
    List<Post> listPosts = await _postRepository.getAllPosts();
    print(listPosts);
    _praticeExploreView.loadPosts(listPosts);
    // } catch (e) {
    _praticeExploreView.showEmptyList();
    // print(e);
    // }
  }
}
