import 'dart:math';

import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/constatns/locations.dart';
import 'package:military_mobility_platform_frontend/model/mobility_request.dart';
import 'package:military_mobility_platform_frontend/service/api.dart';

class MobilityRequestProvider extends ChangeNotifier {
  String _departure = kLocations[0];
  String _destination = kLocations[0];
  int _passengers = 0;
  DateTime _departureTime = DateTime.now();
  DateTime _arrivalTime = DateTime.now();

  String get departure => _departure;
  String get destination => _destination;
  int get passengers => _passengers;
  DateTime get departureTime => _departureTime;
  DateTime get arrivalTime => _arrivalTime;

  void setLocations({String? departure, String? destination}) {
    _departure = departure ?? _departure;
    _destination = destination ?? _destination;
    notifyListeners();
  }

  void increasePassengers() {
    _passengers += 1;
    notifyListeners();
  }

  void decreasePassengers() {
    _passengers = max(0, _passengers - 1);
    notifyListeners();
  }

  void setDepartureTime(DateTime val) {
    _departureTime = val;
    notifyListeners();
  }

  void setArrivalTime(DateTime val) {
    _arrivalTime = val;
    notifyListeners();
  }

  MobilityRequestResDTO request() {
    final dto = MobilityRequestReqDTO(
        departure: _departure,
        destination: _destination,
        passengers: _passengers);
    return APIService.requestMobilities(dto);
  }
}
