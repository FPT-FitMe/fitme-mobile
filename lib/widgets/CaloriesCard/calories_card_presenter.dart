import 'package:fitme/di/injection.dart';
import 'package:fitme/models/target_weight.dart';
import 'package:fitme/models/weight_log.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/widgets/CaloriesCard/calories_card_view.dart';

class CaloriesCardPresenter {
  CaloriesCardView _caloriesCardView;
  late TraineeRepository _traineeRepository;

  CaloriesCardPresenter(this._caloriesCardView) {
    _traineeRepository = new Injector().traineeRepository;
  }

  void loadAllWeightLog() async {
    try {
      List<WeightLog> listWeightLogs =
          await _traineeRepository.getAllWeightLog();
      _caloriesCardView.loadAllWeightLog(listWeightLogs);
    } catch (e) {
      _caloriesCardView.loadAllWeightLog([]);
      print(e);
    }
  }

  void loadTargetWeight() async {
    try {
      TargetWeight targetWeight = await _traineeRepository.getTargetWeight();
      _caloriesCardView.loadTargetWeight(targetWeight);
    } catch (e) {
      _caloriesCardView.loadTargetWeight(null);
      print(e);
    }
  }
}
