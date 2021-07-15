import 'package:fitme/models/meal.dart';
import 'package:fitme/models/plan_meal.dart';

abstract class DetailMealView {
  void loadMealDetail(Meal meal, bool isFavorite);
  void refresh();
  void showFailedModal(String message);
  void showEmpty();
  void addFavoriteSuccess();
  void addFavoriteFailed(String message);
  void unFavoriteSuccess();
  void unFavoriteFailed(String message);
  void logMealSuccess();
  void logMealFailed();
  void skipMealSuccess();
  void skipMealFailed();
  void loadPlanMeal(PlanMeal planMeal);
}
