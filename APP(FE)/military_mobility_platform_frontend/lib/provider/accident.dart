import 'package:flutter/material.dart';

class AccidentProvider extends ChangeNotifier {
  String _accidentType = "";
  String _accidentLocation = "";
  var _accidentImage = null;

  String get accidentType => _accidentType;
  String get accidentLocation => _accidentLocation;
  get accidentImage => _accidentImage;

  void accidentTypeSet(String accidentType) {
    _accidentType = accidentType;
    notifyListeners();
  }

  void accidentLocationSet(String accidentLocation) {
    _accidentLocation = accidentLocation;
    notifyListeners();
  }
 
  void accidentImageSet(var accidentImage) {
    _accidentImage = accidentImage;
    notifyListeners();
  }
}
