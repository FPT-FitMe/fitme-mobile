import 'package:fitme/di/injection.dart';
import 'package:fitme/models/target_weight.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_drawer_form_view.dart';

class BottomDrawerFormPresenter {
  BottomDrawerFormView _bottomDrawerFormView;
  late TraineeRepository _traineeRepository;

  BottomDrawerFormPresenter(this._bottomDrawerFormView) {
    _traineeRepository = new Injector().traineeRepository;
  }

  void logWeight(double value) async {
    try {
      await _traineeRepository.logWeight(value);
      _bottomDrawerFormView.showToast("Log cân nặng thành công");
    } catch (e) {
      _bottomDrawerFormView.showToast("Log cân nặng thất bại");
      print(e);
    }
  }

  void loadTargetWeight() async {
    try {
      TargetWeight targetWeight = await _traineeRepository.getTargetWeight();
      _bottomDrawerFormView.loadTargetWeight(targetWeight);
    } catch (e) {
      _bottomDrawerFormView.loadTargetWeight(null);
      print(e);
    }
  }
}
