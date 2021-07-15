import 'package:fitme/models/workout.dart';

abstract class DetailPracticeView {
  void loadWorkoutDetail(Workout workout, bool isFavorite);
  void refresh();
  void showFailedModal(String message);
  void showEmptyList();
  void addFavoriteSuccess();
  void addFavoriteFailed(String message);
  void unFavoriteSuccess();
  void unFavoriteFailed(String message);
}
