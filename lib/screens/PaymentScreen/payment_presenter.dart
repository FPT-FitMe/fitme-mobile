import 'package:fitme/di/injection.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/screens/PaymentScreen/payment_view.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PaymentPresenter {
  PaymentView _paymentView;
  late TraineeRepository _traineeRepository;
  FlutterSecureStorage _storage = new FlutterSecureStorage();

  PaymentPresenter(this._paymentView) {
    _traineeRepository = new Injector().traineeRepository;
  }

  void buySubscription() async {
    try {
      await _traineeRepository.buySubscription();
      await _storage.write(key: "isPremium", value: "true");
      _paymentView.success();
    } catch (e) {
      print(e);
    }
  }
}
