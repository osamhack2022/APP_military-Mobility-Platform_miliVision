import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  bool get isLoggedIn => _token != null;
  String get token => _token ?? "";

  void login(String id, String passwd) {
    _token = '$id-$passwd';
    notifyListeners();
  }

  void logout() {
    _token = null;
    notifyListeners();
  }
}
