import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/model/user.dart';
import 'package:military_mobility_platform_frontend/service/api.dart';
import 'package:military_mobility_platform_frontend/service/localstorage.dart';

class AuthProvider extends ChangeNotifier {
  String? _token = LocalStorage().readUserToken();

  bool get isLoggedIn => _token != null;
  String get token => _token ?? "";

  void login(String id, String password) async {
    final response =
        await APIService.login(LoginReqDTO(login_id: id, password: password));
    if (response != null) {
      _token = response.token;
      LocalStorage().writeUserToken(_token!);
      notifyListeners();
    }
  }

  void logout() {
    _token = null;
    LocalStorage().removeUserToken();
    notifyListeners();
  }
}
