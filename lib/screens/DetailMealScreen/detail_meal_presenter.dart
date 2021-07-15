import 'package:fitme/di/injection.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/plan.dart';
import 'package:fitme/models/plan_meal.dart';
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
      bool isFavorite = false;
      Meal meal = await _mealRepository.getMealById(id);
      List<Meal> list = await _traineeRepository.getFavouriteMeals();
      if (list.isNotEmpty) {
        var contain = list.where((element) => element.mealID == meal.mealID);
        if (contain.isNotEmpty) {
          isFavorite = true;
        }
      }
      _detailMealView.loadMealDetail(meal, isFavorite);
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

  Future<void> logMeal(PlanMeal planMeal) async {
    try {
      // MealLog mealLog =
      await _traineeRepository.logMeal(planMeal.meal);
      setStatusUpdatePlanDone(planMeal);
      _detailMealView.logMealSuccess();
    } catch (e) {
      _detailMealView.logMealFailed();
      print(e);
    }
  }

  Future<void> setStatusUpdatePlanDone(PlanMeal planMeal) async {
    try {
      await _planRepository.updatePlanMealDone(planMeal);
    } catch (e) {
      print(e);
    }
  }

  Future<void> setStatusUpdatePlanSkipped(PlanMeal planMeal) async {
    try {
      await _planRepository.updatePlanMealSkipped(planMeal);
      _detailMealView.skipMealSuccess();
    } catch (e) {
      _detailMealView.skipMealFailed();
      print(e);
    }
  }

  Future<void> loadPlanMeal(PlanMeal planMeal) async {
    try {
      DateTime dateTime = DateTime.now();
      Plan plan = await _planRepository.getPlan(dateTime);
      for (PlanMeal pM in plan.planMeals.values) {
        if (pM.id == planMeal.id) {
          _detailMealView.loadPlanMeal(pM);
          break;
        }
      }
    } catch (e) {
      _detailMealView.showEmpty();
      print(e);
    }
  }
}
