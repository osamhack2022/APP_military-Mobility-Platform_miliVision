import 'dart:convert';

import 'package:military_mobility_platform_frontend/model/user.dart';
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

  void writeUserToken(TokenDTO token) {
    _prefs.setString('token', jsonEncode(token));
  }

  void removeUserToken() {
    _prefs.remove('token');
  }

  TokenDTO? readUserToken() {
    final token = _prefs.getString('token');
    return token != null ? TokenDTO.fromJson(jsonDecode(token)) : null;
  }
}
