import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:military_mobility_platform_frontend/model/reservation.dart';
import 'package:military_mobility_platform_frontend/service/distance.dart';

class DriveInfoProvider extends ChangeNotifier {
  ReservationDTO? _reservation;
  Location? _location;
  StreamController<LatLng>? _locationStreamController;
  List<LatLng> _polyLineCoordinates = [];
  LatLng? _currentLocation;
  DateTime? _startTime;
  double _totalDistance = 0.0;

  ReservationDTO? get reservation => _reservation;
  bool get selectionExists => _reservation != null;
  bool get isDriving => _location != null;
  Stream<LatLng>? get locationStream => _locationStreamController!.stream;
  Duration? get drivingTime =>
      _startTime != null ? DateTime.now().difference(_startTime!) : null;
  double? get drivingDistance => _totalDistance;
  List<LatLng> get polyLineCoordinates => _polyLineCoordinates;
  LatLng? get currentLocation => _currentLocation;

  void selectReservation(ReservationDTO reservation) {
    _reservation = reservation;
    notifyListeners();
  }

  void deselectReservation() {
    _reservation = null;
    notifyListeners();
  }

  Future<void> startDrive() async {
    _initDataToStartDrive();

    final currentLocation = await _location!.getLocation();
    _updateLocation(
        LatLng(currentLocation.latitude!, currentLocation.longitude!));
    _location!.onLocationChanged.listen((newLocation) {
      _updateLocation(LatLng(newLocation.latitude!, newLocation.longitude!));
    });
  }

  Future<void> startDriveMock() async {
    _initDataToStartDrive();

    const latitude = 36.2745577;
    const longitude = 127.2485896;
    const startPos = LatLng(latitude, longitude);
    const interval = 1.7;

    _updateLocation(startPos);
    var lastPos = startPos;
    final rng = Random();
    Timer.periodic(Duration(milliseconds: (1000.0 * interval).round()),
        (timer) {
      final theta = rng.nextDouble() * 3.141592 * 2;
      final dx = cos(theta) * 0.001;
      final dy = sin(theta) * 0.001;
      lastPos = LatLng(lastPos.latitude + dx, lastPos.longitude + dy);
      _updateLocation(lastPos);
    });
  }

  void _initDataToStartDrive() {
    _location = Location();
    _locationStreamController = StreamController<LatLng>();
    _polyLineCoordinates = [];
    _startTime = DateTime.now();
    _totalDistance = 0.0;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      notifyListeners();
    });
  }

  void _updateLocation(LatLng location) {
    if (_polyLineCoordinates.isNotEmpty) {
      _totalDistance +=
          Distance.twoPoints(location, _polyLineCoordinates.last).value;
    }
    _locationStreamController!.add(location);
    _polyLineCoordinates.add(location);
    _currentLocation = location;
    notifyListeners();
  }
}
