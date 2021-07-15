import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserUtils {
  static Future<bool> checkIfUserIsPremium() async {
    FlutterSecureStorage _storage = new FlutterSecureStorage();
    String? isUserPremium = await _storage.read(key: "isPremium");
    if (isUserPremium == "true") return true;
    return false;
  }
}
