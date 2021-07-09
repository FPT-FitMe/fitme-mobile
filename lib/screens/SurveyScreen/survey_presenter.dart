import 'package:fitme/di/injection.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/screens/SurveyScreen/survey_view.dart';

class SurveyPresenter {
  SurveyView _surveyView;
  late TraineeRepository _traineeRepository;

  SurveyPresenter(this._surveyView) {
    _traineeRepository = new Injector().traineeRepository;
  }

  Future<void> doSurvey(
      int gender,
      int age,
      double heightInCm,
      double weightInKg,
      int dietPreferenceType,
      int targetWeightInKg,
      int durationInDays,
      int exerciseFrequencyType) async {
    try {
      bool result = await _traineeRepository.doSurvey(
          gender,
          age,
          heightInCm,
          weightInKg,
          dietPreferenceType,
          targetWeightInKg,
          durationInDays,
          exerciseFrequencyType);
      result
          ? _surveyView.doSurveySuccess()
          : _surveyView.doSurveyFail("Lỗi không xác định");
    } catch (e) {
      print(e);
    }
  }
}
