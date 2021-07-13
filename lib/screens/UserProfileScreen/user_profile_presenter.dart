import 'package:fitme/di/injection.dart';
import 'package:fitme/models/user.dart';
import 'package:fitme/repository/user_repository.dart';
import 'package:fitme/screens/UserProfileScreen/user_profile_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePresenter {
  UserProfileView _userProfileView;
  late UserRepository _userRepository;

  UserProfilePresenter(this._userProfileView) {
    _userRepository = new Injector().userRepository;
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
}
