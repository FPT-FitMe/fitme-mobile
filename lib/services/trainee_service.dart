import 'package:dio/dio.dart';
import 'package:fitme/configs/http_service.dart';
import 'package:fitme/repository/trainee_repository.dart';

class TraineeService implements TraineeRepository {
  Dio dio = new HttpService().dio;

  @override
  Future<bool> doSurvey(
      int gender,
      int age,
      double heightInCm,
      double weightInKg,
      int dietPreferenceType,
      int targetWeightInKg,
      int durationInDays,
      int exerciseFrequencyType) async {
    final response = await dio.post("/trainee/completeSurvey", data: {
      "gender": gender,
      "age": age,
      "heightInCm": heightInCm,
      "weightInKg": weightInKg,
      "dietPreferenceType": dietPreferenceType,
      "targetWeightInKg": targetWeightInKg,
      "durationInDays": durationInDays,
      "exerciseFrequencyType": exerciseFrequencyType,
    });
    return response.statusCode == 200 ? true : false;
  }
}
