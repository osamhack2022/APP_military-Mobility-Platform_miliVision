import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late final SharedPreferences _prefs;
  LocalStorage._privateConstructor();
  static final LocalStorage _instance = LocalStorage._privateConstructor();

  factory LocalStorage() {
    return _instance;
  }

  Future<void> fetch() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void writeUserToken(String token) {
    _prefs.setString('token', token);
  }

  void removeUserToken() {
    _prefs.remove('token');
  }

  String? readUserToken() {
    return _prefs.getString('token');
  }
}
