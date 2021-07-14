import 'package:fitme/di/injection.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/meal_log.dart';
import 'package:fitme/models/plan.dart';
import 'package:fitme/repository/meal_repository.dart';
import 'package:fitme/repository/plan_repository.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/screens/DetailMealScreen/detail_meal_view.dart';

class DetailMealPresenter {
  DetailMealView _detailMealView;
  late MealRepository _mealRepository;
  late TraineeRepository _traineeRepository;
  late PlanRepository _planRepository;

  DetailMealPresenter(this._detailMealView) {
    _mealRepository = new Injector().mealRepository;
    _traineeRepository = new Injector().traineeRepository;
    _planRepository = new Injector().planRepository;
  }

  Future<void> loadMealByID(int id) async {
    try {
      Meal meal = await _mealRepository.getMealById(id);
      _detailMealView.loadMealDetail(meal);
    } catch (e) {
      _detailMealView.showEmpty();
      print(e);
    }
  }

  Future<void> addFavorite(Meal meal) async {
    try {
      bool result = await _traineeRepository.addFavoriteMeal(meal);
      if (result) {
        _detailMealView.addFavoriteSuccess();
      }
    } catch (e) {
      _detailMealView
          .addFavoriteFailed("Thêm vào list yêu thích không thành công!");
      print(e);
    }
  }

  Future<void> unFavorite(Meal meal) async {
    try {
      bool result = await _traineeRepository.unFavoriteMeal(meal);
      if (result) {
        _detailMealView.unFavoriteSuccess();
      }
    } catch (e) {
      _detailMealView
          .unFavoriteFailed("Xóa khỏi list yêu thích không thành công!");
      print(e);
    }
  }

  Future<void> logMeal(Meal meal) async {
    try {
      MealLog mealLog = await _traineeRepository.logMeal(meal);
      setStatusUpdatePlan(meal);
      _detailMealView.logMealSuccess();
    } catch (e) {
      _detailMealView.logMealFailed();
      print(e);
    }
  }

  Future<void> setStatusUpdatePlan(Meal currentMeal) async {
    try {
      DateTime dateTime = DateTime.now();
      Plan plan = await _planRepository.getPlan(dateTime);
      for (var i = 0; i < 3; i++) {
        if (plan.planMeals[i] != null &&
            plan.planMeals[i]!.meal == currentMeal) {
          await _planRepository.updatePlanMealDone(plan.planMeals[i]);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
