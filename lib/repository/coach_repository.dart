import 'package:fitme/models/coach.dart';

abstract class CoachRepository {
  Future<List<Coach>> getAllCoaches();
}
