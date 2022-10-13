import 'package:flutter/material.dart';

class OperationInfoProvider extends ChangeNotifier {
  String _safetyCheck = "False";
  String _driverInfo = "";
  String _commanderInfo = "";
  String _operationPurpose = "";
  String _operationNote = "";
  String _vehicleReturn = "False";

  String get safetyCheck => _safetyCheck;
  String get driverInfo => _driverInfo;
  String get commanderInfo => _commanderInfo;
  String get operationPurpose => _operationPurpose;
  String get operationNote => _operationNote;

  void safetyCheckTrue() {
    _safetyCheck = "True";
    notifyListeners();
  }

  void set safetyCheck(String safetyCheck) {
    _safetyCheck = safetyCheck;
    notifyListeners();
  }

  void set driverInfo(String driverInfo) {
    _driverInfo = driverInfo;
    notifyListeners();
  }

  void set commanderInfo(String commanderInfo) {
    _commanderInfo = commanderInfo;
    notifyListeners();
  }

  void set operationPurpose(String operationPurpose) {
    _operationPurpose = operationPurpose;
    notifyListeners();
  }

  void set operationNote(String operationNote) {
    _operationNote = operationNote;
    notifyListeners();
  }
}
