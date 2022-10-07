import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/model/user.dart';
import 'package:military_mobility_platform_frontend/service/api.dart';
import 'package:military_mobility_platform_frontend/service/localstorage.dart';

class AuthProvider extends ChangeNotifier {
  TokenDTO? _token = LocalStorage().readUserToken();

  bool get isLoggedIn => _token != null;
  TokenDTO? get token => _token;

  Future<bool> login({required String id, required String password}) async {
    // final response =
    //     await APIService.login(LoginReqDTO(login_id: id, password: password));
    // if (response != null) {
    //   _token = response.token;
    //   LocalStorage().writeUserToken(_token!);
    //   APIService.setUserToken(_token!);
    //   notifyListeners();
    //   return true;
    // } else {
    //   return false;
    // }
    _token = TokenDTO(access: id, refresh: password);
    LocalStorage().writeUserToken(_token!);
    notifyListeners();
    return true;
  }

  void logout() {
    _token = null;
    LocalStorage().removeUserToken();
    APIService.removeUserToken();
    notifyListeners();
  }

  Future<bool> register(
      {required String id,
      required String password,
      required String email,
      required String battalionID}) async {
    final dto = RegisterReqDTO(
        login_id: id,
        password: password,
        email: email,
        battalion_id: battalionID);
    final response = await APIService.register(dto);
    return response != null;
  }
}
