import 'package:fitme/di/injection.dart';
import 'package:fitme/models/user.dart';
import 'package:fitme/repository/image_repository.dart';
import 'package:fitme/repository/user_repository.dart';
import 'package:fitme/screens/AccountDetailScreen/account_detail_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountDetailPresenter {
  AccountDetailView _userProfileView;
  late UserRepository _userRepository;
  late ImageRepository _imageRepository;

  AccountDetailPresenter(this._userProfileView) {
    _userRepository = new Injector().userRepository;
    _imageRepository = new Injector().imageRepository;
  }

  void uploadImage(String imagePath) async {
    try {
      String? imageUrl = await _imageRepository.uploadImage(imagePath);
      _userProfileView.updateImageUrl(imageUrl.toString());
    } catch (e) {
      print(e);
      _userProfileView.showFailedModal("Lỗi khi upload ảnh");
    }
  }

  void loadUserProfile() async {
    try {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      int? userID = _preferences.getInt("userID");
      User user = await _userRepository.getUserByID(userID!);
      _userProfileView.loadUser(user);
    } catch (e) {
      print(e);
    }
  }

  void updateUser(User user) async {
    try {
      User updatedUser = await _userRepository.updateUser(user);
      _userProfileView.showSuccessModal(
          updatedUser, "Cập nhật ${updatedUser.lastName} thành công");
    } catch (e) {
      _userProfileView.showFailedModal("Lỗi khi cập nhật người dùng");
      print(e);
    }
  }
}
