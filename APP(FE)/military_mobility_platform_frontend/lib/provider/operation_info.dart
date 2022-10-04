import 'package:flutter/material.dart';

class OperationInfoProvider extends ChangeNotifier {
  String _driverInfo = "";
  String _commanderInfo = "";
  String _operationPurpose = "";
  String _operationNote = "";

  String get driverInfo => _driverInfo;
  String get commanderInfo => _commanderInfo;
  String get operationPurpose => _operationPurpose;
  String get operationNote => _operationNote;

  void set DriverInfo(String driverInfo) {
    _driverInfo = driverInfo;
    notifyListeners();
  }

  void set CommanderInfo(String commanderInfo) {
    _commanderInfo = commanderInfo;
    notifyListeners();
  }

  void set OperationPurpose(String operationPurpose) {
    _operationPurpose = operationPurpose;
    notifyListeners();
  }

  void set OperationNote(String operationNote) {
    _operationNote = operationNote;
    notifyListeners();
  }
}
