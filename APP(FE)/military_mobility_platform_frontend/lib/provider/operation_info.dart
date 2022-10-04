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

  void setDriverInfo({String? driverInfo}) {
    _driverInfo = driverInfo ?? _driverInfo;
    notifyListeners();
  }

  void setCommanderInfo({String? commanderInfo}) {
    _commanderInfo = commanderInfo ?? _commanderInfo;
    notifyListeners();
  }

  void setOperationPurpose({String? operationPurpose}) {
    _operationPurpose = operationPurpose ?? _operationPurpose;
    notifyListeners();
  }

  void setOperationNote({String? operationNote}) {
    _operationNote = operationNote ?? _operationNote;
    notifyListeners();
  }
}
