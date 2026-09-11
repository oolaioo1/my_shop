import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_shop/contants/index.dart';

class TokenManager {
  static String? token;

  Future<SharedPreferences> _getInstance() {
    return SharedPreferences.getInstance();
  }

  String _token = "";

  init() {}

  Future<void> setToken(String val) async {
    TokenManager.token = val;
    final prefs = await _getInstance();
    prefs.setString(GlobalConstants.TOKEN_KEY, val);
    _token = val;
  }

  String getToken() {
    return _token;
  }

  Future<void> removeToken() async {
    final prefs = await _getInstance();
    prefs.remove(GlobalConstants.TOKEN_KEY);
    _token = "";
  }
}

final tokenManager = TokenManager();
