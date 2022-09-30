import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/service/localstorage.dart';

class AuthProvider extends ChangeNotifier {
  String? _token = LocalStorage().readUserToken();

  bool get isLoggedIn => _token != null;
  String get token => _token ?? "";

  void login(String id, String passwd) {
    _token = '$id-$passwd';
    LocalStorage().writeUserToken(_token!);
    notifyListeners();
  }

  void logout() {
    _token = null;
    LocalStorage().removeUserToken();
    notifyListeners();
  }
}
