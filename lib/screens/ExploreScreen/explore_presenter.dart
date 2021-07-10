import 'package:fitme/di/injection.dart';
import 'package:fitme/models/plan.dart';
import 'package:fitme/repository/plan_repository.dart';
import 'package:fitme/screens/ExploreScreen/explore_view.dart';

class ExplorePresenter {
  ExploreView _exploreView;
  late PlanRepository _planRepository;

  ExplorePresenter(this._exploreView) {
    _planRepository = new Injector().planRepository;
  }

  Future<void> loadPlan(DateTime dateTime) async {
    try {
      Plan plan = await _planRepository.getPlan(dateTime);
      print(plan);
      _exploreView.loadPlan(plan);
    } catch (e) {
      _exploreView.showEmptyPlan();
      print(e);
    }
  }
}
