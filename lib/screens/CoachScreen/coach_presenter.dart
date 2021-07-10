import 'package:fitme/models/coach.dart';
import 'package:fitme/models/exercise.dart';
import 'package:fitme/repository/coach_repository.dart';
import 'package:fitme/repository/exercise_repository.dart';
import 'package:fitme/di/injection.dart';
import 'package:fitme/screens/CoachScreen/coach_view.dart';

class CoachPresenter {
  CoachExploreView _coachExploreView;
  late CoachRepository _coachRepository;

  CoachPresenter(this._coachExploreView) {
    _coachRepository = new Injector().coachRepository;
  }

  void loadAllCoaches() async {
    try {
      List<Coach> listCoaches = await _coachRepository.getAllCoaches();
      _coachExploreView.loadAllCoaches(listCoaches);
    } catch (e) {
      _coachExploreView.showEmptyList();
      print(e);
    }
  }
}
