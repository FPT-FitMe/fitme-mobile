import 'package:fitme/models/meal.dart';

abstract class DetailMealView {
  void loadMealDetail(Meal meal);
  void refresh();
  void showFailedModal(String message);
  void showEmpty();
  void addFavoriteSuccess();
  void addFavoriteFailed(String message);
  void unFavoriteSuccess();
  void unFavoriteFailed(String message);
}
