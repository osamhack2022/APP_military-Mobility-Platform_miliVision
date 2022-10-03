import 'package:flutter/material.dart';

class UserInfoProvider extends ChangeNotifier {
  var _userImage;
  String _userName = "사용자명";
  String _regiment = "소속";

  get userImage => _userImage;
  String get userName => _userName;
  String get regiment => _regiment;

  void set UserImage(var userImage) {
    _userImage = userImage;
    notifyListeners();
  }

  void set UserName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void set Regiment(String regiment) {
    _regiment = regiment;
    notifyListeners();
  }
}
