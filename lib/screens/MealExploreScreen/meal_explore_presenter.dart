import 'package:fitme/models/meal.dart';
import 'package:fitme/repository/meal_repository.dart';
import 'package:fitme/di/injection.dart';
import 'package:fitme/screens/MealExploreScreen/meal_explore_view.dart';

class MealPresenter {
  MealExploreView _mealExploreView;
  late MealRepository _mealRepository;

  MealPresenter(this._mealExploreView) {
    _mealRepository = new Injector().mealRepository;
  }

  void loadAllMeals() async {
    try {
      List<Meal> listMeal = await _mealRepository.getAllMeals();
      _mealExploreView.loadAllMeals(listMeal);
    } catch (e) {
      _mealExploreView.showEmptyList();
      print(e);
    }
  }
}
