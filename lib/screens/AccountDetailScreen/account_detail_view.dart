import 'package:fitme/models/user.dart';

abstract class AccountDetailView {
  void loadUser(User user);

  void updateImageUrl(String imageUrl);

  void showFailedModal(String s);

  void showSuccessModal(User updatedUser, String s);
}
