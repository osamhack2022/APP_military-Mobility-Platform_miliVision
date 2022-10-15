import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/model/accident.dart';
import 'package:military_mobility_platform_frontend/model/mobility.dart';
import 'package:military_mobility_platform_frontend/service/api.dart';

class AccidentProvider extends ChangeNotifier {
  List<AccidentDTO> _accidentReports = [];
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
  
  Future<AccidentDTO> postAccidentReport(
      Dio authClient, MobilityDTO mobility) async {
    try {
      final dto = OperationDTO(
          car: mobility.id,
          incident_type: _accidentType,
          location: _accidentLocation,
          image: _accidentImage);
      
      return APIService(authClient).postAccidentReport(dto);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  
  Future<AccidentDTO> postAccidentReport(
      Dio authClient, MobilityDTO mobility) async {
    try {
      final dto = OperationDTO(
          car: mobility.id,
          incident_type: _accidentType,
          location: _accidentLocation,
          image: _accidentImage);
      
      return APIService(authClient).postAccidentReport(dto);
    } catch (exception) {
      return Future.error(exception.toString());
    }  
    
  Future<bool> getAccidentReport(Dio authClient) async {
    try {
      final rep = await APIService(authClient).getAccidentReport();
      _accidentReports = rep;
      notifyListeners();
      return true;
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
    
}
