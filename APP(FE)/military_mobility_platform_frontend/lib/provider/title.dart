import 'package:flutter/material.dart';

class TitleProvider extends ChangeNotifier {
  String _title = "";
  String get title => _title;
  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }
}
