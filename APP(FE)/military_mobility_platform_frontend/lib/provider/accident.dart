import 'package:flutter/material.dart';

class AccidentProvider extends ChangeNotifier {
  String _accidentType = "";
  String _accidentLocation = "";
  var _accidentImage = null;

  String _recoveryTeamRequestLocation = "";
  String _recoveryTeamRequestService = "";
  String _recoveryTeamRequestNote = "";

  String get accidentType => _accidentType;
  String get accidentLocation => _accidentLocation;
  get accidentImage => _accidentImage;

  String get recoveryTeamRequestLocation => _recoveryTeamRequestLocation;
  String get recoveryTeamRequestService => _recoveryTeamRequestService;
  String get recoveryTeamRequestNote => _recoveryTeamRequestNote;

  String recoveryTeamRequestLocationGet() {
    return _recoveryTeamRequestLocation;
    notifyListeners();
  }

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

  void recoveryTeamRequestLocationSet(String recoveryTeamRequestLocation) {
    _recoveryTeamRequestLocation = recoveryTeamRequestLocation;
    notifyListeners();
  }

  void recoveryTeamRequestServiceSet(String recoveryTeamRequestService) {
    _recoveryTeamRequestService = recoveryTeamRequestService;
    notifyListeners();
  }

  void recoveryTeamRequestNoteSet(String recoveryTeamRequestNote) {
    _recoveryTeamRequestNote = recoveryTeamRequestNote;
    notifyListeners();
  }
}
