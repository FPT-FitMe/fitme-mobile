import 'package:fitme/di/injection.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/screens/FavoriteScreen/favorite_view.dart';

class FavoritePresenter {
  FavoriteView _favoriteView;
  late TraineeRepository _traineeRepository;

  FavoritePresenter(this._favoriteView) {
    _traineeRepository = new Injector().traineeRepository;
  }

  void loadFavouriteMeals() async {
    try {
      List<Meal> listMeals = await _traineeRepository.getFavouriteMeals();
      _favoriteView.loadFavouriteMeals(listMeals);
    } catch (e) {
      print(e);
    }
  }

  void loadFavouriteWorkouts() async {
    try {
      List<Workout> listWorkouts =
          await _traineeRepository.getFavouriteWorkouts();
      _favoriteView.loadFavouriteWorkouts(listWorkouts);
    } catch (e) {
      print(e);
    }
  }
}
