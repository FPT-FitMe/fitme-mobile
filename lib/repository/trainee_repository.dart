abstract class TraineeRepository {
  Future<bool> doSurvey(
      //success=true
      int gender,
      int age,
      double heightInCm,
      double weightInKg,
      int dietPreferenceType,
      int targetWeightInKg,
      int durationInDays,
      int exerciseFrequencyType);
}
