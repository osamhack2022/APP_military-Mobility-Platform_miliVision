import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/model/user.dart';
import 'package:military_mobility_platform_frontend/service/api.dart';
import 'package:military_mobility_platform_frontend/service/localstorage.dart';

class AuthProvider extends ChangeNotifier {
  TokenDTO? _token = LocalStorage().readUserToken();

  bool get isLoggedIn => _token != null;
  TokenDTO? get token => _token;
  Dio? get authenticatedClient => isLoggedIn
      ? Dio(BaseOptions(headers: {'Authorization': 'Bearer ${_token!.access}'}))
      : null;

  Future<bool> login({required String id, required String password}) async {
    try {
      final response = await APIService(Dio())
          .login(LoginReqDTO(loginID: id, password: password));
      _token = response.token;
      LocalStorage().writeUserToken(_token!);
      notifyListeners();
      return true;
    } catch (_) {
      return false;
    }
  }

  void logout() {
    _token = null;
    LocalStorage().removeUserToken();
    notifyListeners();
  }

  Future<bool> register(
      {required String id,
      required String password,
      required String email,
      required String battalionID,
      required int permission}) async {
    try {
      final dto = RegisterReqDTO(
          loginID: id,
          password: password,
          email: email,
          battalionID: battalionID,
          permission: permission);
      await APIService(Dio()).register(dto);
      return true;
    } catch (_) {
      return false;
    }
  }
}
