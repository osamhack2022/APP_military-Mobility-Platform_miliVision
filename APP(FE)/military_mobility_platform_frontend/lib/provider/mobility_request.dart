import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/constatns/locations.dart';
import 'package:military_mobility_platform_frontend/model/mobility.dart';
import 'package:military_mobility_platform_frontend/model/reservation.dart';
import 'package:military_mobility_platform_frontend/service/api.dart';

class MobilityRequestProvider extends ChangeNotifier {
  String _departure = kLocations[0];
  String _destination = kLocations[0];
  int _passengers = 0;
  DateTime _departureTime = DateTime.now();
  DateTime _arrivalTime = DateTime.now();
  List<MobilityDTO> _availableMobilities = [];

  String get departure => _departure;
  String get destination => _destination;
  int get passengers => _passengers;
  DateTime get departureTime => _departureTime;
  DateTime get arrivalTime => _arrivalTime;
  List<MobilityDTO> get availableMobilities => _availableMobilities;

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

  Future<void> getAvailableMobilities(Dio authClient) async {
    try {
      final dto = GetAvailableMobilitiesReqDTO(
          passengers: _passengers,
          departureTime: _departureTime,
          arrivalTime: _arrivalTime);
      final response = await APIService(authClient).getAvailableMobilities(dto);
      _availableMobilities = response;
      notifyListeners();
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<MakeReservationResDTO> makeReservation(
      Dio authClient, MobilityDTO mobility) async {
    try {
      final dto = MakeReservationReqDTO(
          carID: mobility.id,
          departure: departure,
          destination: destination,
          startTime: _departureTime,
          endTime: _arrivalTime);
      return APIService(authClient).makeReservation(dto);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
