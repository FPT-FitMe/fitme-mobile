import 'package:fitme/models/coach.dart';

abstract class CoachExploreView {
  void loadAllCoaches(List<Coach> listCoaches);
  void showEmptyList();
}
