import 'package:flutter/material.dart';

class UserInfoProvider extends ChangeNotifier {
  String _userName = "";
  String _regiment = "";

  String get userName => _userName;
  String get regiment => _regiment;

  void set UserName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void set Regiment(String regiment) {
    _regiment = regiment;
    notifyListeners();
  }
}
