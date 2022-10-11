import 'package:flutter/material.dart';

class AccidentProvider extends ChangeNotifier {
  var _accidentImage = null;

  get accidentImage => _accidentImage;
 
  void set accidentImage(var accidentImage) {
    _accidentImage = accidentImage;
    notifyListeners();
  }
}
