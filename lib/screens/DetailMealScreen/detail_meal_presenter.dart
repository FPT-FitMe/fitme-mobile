import 'package:fitme/di/injection.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/repository/meal_repository.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/screens/DetailMealScreen/detail_meal_view.dart';

class DetailMealPresenter {
  DetailMealView _detailMealView;
  late MealRepository _mealRepository;
  late TraineeRepository _traineeRepository;

  DetailMealPresenter(this._detailMealView) {
    _mealRepository = new Injector().mealRepository;
    _traineeRepository = new Injector().traineeRepository;
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
}
