import 'package:fitme/di/injection.dart';
import 'package:fitme/models/plan.dart';
import 'package:fitme/models/plan_workout.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/models/workout_log.dart';
import 'package:fitme/repository/plan_repository.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/screens/FeedBackScreen/feedback_view.dart';

class FeedbackPresenter {
  FeedbackView _feedbackView;
  late PlanRepository _planRepository;
  late TraineeRepository _traineeRepository;

  FeedbackPresenter(this._feedbackView) {
    _traineeRepository = new Injector().traineeRepository;
    _planRepository = new Injector().planRepository;
  }

  Future<void> logWorkout(Workout workout, Duration realDuration) async {
    try {
      int duration = realDuration.inMinutes;
      WorkoutLog workoutLog =
          await _traineeRepository.logWorkout(workout, duration, null, null);
      _feedbackView.logWorkoutSuccess();
      setStatusUpdatePlan(workout);
    } catch (e) {
      _feedbackView.logWorkoutFailed();
      print(e);
    }
  }

  Future<void> logWorkoutWithFeedBack(Workout workout, Duration realDuration,
      int difficultFeedback, int experienceFeedback) async {
    try {
      print(realDuration);
      int duration = realDuration.inMinutes;
      WorkoutLog workoutLog = await _traineeRepository.logWorkout(
          workout, duration, difficultFeedback, experienceFeedback);
      _feedbackView.feedBackSuccess();
      setStatusUpdatePlan(workout);
    } catch (e) {
      _feedbackView.feedBackFailed();
      print(e);
    }
  }

  Future<void> setStatusUpdatePlan(Workout currentWorkout) async {
    try {
      DateTime dateTime = DateTime.now();
      Plan plan = await _planRepository.getPlan(dateTime);
      if (plan.planWorkouts[0].workout.workoutID == currentWorkout.workoutID) {
        PlanWorkout planWorkout =
            await _planRepository.updatePlanWorkoutDone(plan.planWorkouts[0]);
      }
    } catch (e) {
      print(e);
    }
  }
}
