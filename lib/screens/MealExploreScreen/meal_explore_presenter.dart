import 'package:fitme/models/meal.dart';
import 'package:fitme/models/tag.dart';
import 'package:fitme/repository/meal_repository.dart';
import 'package:fitme/di/injection.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/screens/MealExploreScreen/meal_explore_view.dart';

class MealPresenter {
  MealExploreView _mealExploreView;
  late MealRepository _mealRepository;
  late TraineeRepository _traineeRepository;

  MealPresenter(this._mealExploreView) {
    _mealRepository = new Injector().mealRepository;
    _traineeRepository = new Injector().traineeRepository;
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

  void loadAllTags() async {
    try {
      List<Tag> listTag = await _mealRepository.getListTagMeal();
      _mealExploreView.loadAllTag(listTag);
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadMealsByTag(Tag tag) async {
    try {
      List<Meal> list = await _mealRepository.getListMealByTag(tag);
      _mealExploreView.loadMealsByTag(list, tag);
    } catch (e) {
      print(e);
      _mealExploreView.showEmptyListMealTag(tag);
    }
  }

  void loadFavouriteMeals() async {
    try {
      List<Meal> listMeals = await _traineeRepository.getFavouriteMeals();
      _mealExploreView.loadFavouriteMeals(listMeals);
    } catch (e) {
      print(e);
    }
  }
}
