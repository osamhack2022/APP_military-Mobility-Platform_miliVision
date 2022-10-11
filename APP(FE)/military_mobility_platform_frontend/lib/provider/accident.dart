import 'package:flutter/material.dart';

class AccidentProvider extends ChangeNotifier {
  String _accidentType = "";
  String _accidentLocation = "";
  var _accidentImage = null;

  String get accidentType => _accidentType;
  String get accidentLocation => _accidentLocation;
  get accidentImage => _accidentImage;

  void set accidentType(String accidentType) {
    _accidentType = accidentType;
    notifyListeners();
  }

  void set accidentLocation(String accidentLocation) {
    _accidentLocation = accidentLocation;
    notifyListeners();
  }
 
  void set accidentImage(var accidentImage) {
    _accidentImage = accidentImage;
    notifyListeners();
  }
}
