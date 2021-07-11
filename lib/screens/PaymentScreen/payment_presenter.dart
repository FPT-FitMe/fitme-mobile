import 'package:fitme/di/injection.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/screens/PaymentScreen/payment_view.dart';

class PaymentPresenter {
  PaymentView _paymentView;
  late TraineeRepository _traineeRepository;

  PaymentPresenter(this._paymentView) {
    _traineeRepository = new Injector().traineeRepository;
  }

  void buySubscription() async {
    try {
      await _traineeRepository.buySubscription();
      _paymentView.success();
    } catch (e) {
      print(e);
    }
  }
}
