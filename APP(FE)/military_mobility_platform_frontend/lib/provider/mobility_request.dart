import 'dart:math';

import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/constatns/locations.dart';
import 'package:military_mobility_platform_frontend/model/mobility_request.dart';
import 'package:military_mobility_platform_frontend/service/api.dart';

class MobilityRequestProvider extends ChangeNotifier {
  String _departure = kLocations[0];
  String _destination = kLocations[0];
  int _drivers = 0;
  int _seniorPassengers = 0;
  int _passengers = 0;

  String get departure => _departure;
  String get destination => _destination;
  int get drivers => _drivers;
  int get seniorPassengers => _seniorPassengers;
  int get passengers => _passengers;

  void setLocations({String? departure, String? destination}) {
    _departure = departure ?? _departure;
    _destination = destination ?? _destination;
    notifyListeners();
  }

  void setPassengers({int? drivers, int? seniorPassengers, int? passengers}) {
    _drivers = max(drivers ?? _drivers, 0);
    _seniorPassengers = max(seniorPassengers ?? _seniorPassengers, 0);
    _passengers = max(passengers ?? _passengers, 0);
    notifyListeners();
  }

  MobilityRequestResDTO request() {
    final dto = MobilityRequestReqDTO(
        departure: _departure,
        destination: _destination,
        drivers: _drivers,
        seniorPassengers: _seniorPassengers,
        passengers: _passengers);
    return APIService.requestMobilities(dto);
  }
}
