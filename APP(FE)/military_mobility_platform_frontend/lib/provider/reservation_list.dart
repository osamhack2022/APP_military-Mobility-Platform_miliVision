import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/model/reservation.dart';
import 'package:military_mobility_platform_frontend/service/api.dart';

class ReservationListProvider extends ChangeNotifier {
  List<ReservationDTO> _reservations = [];
  int? _selectedIdx;

  List<ReservationDTO> get reservations => _reservations;
  ReservationDTO? get selectedReservation =>
      _selectedIdx != null ? _reservations[_selectedIdx!] : null;

  void select(int index) {
    _selectedIdx = index;
    notifyListeners();
  }

  void deselect() {
    _selectedIdx = null;
    notifyListeners();
  }

  Future<bool> getReservations(Dio authClient) async {
    try {
      final res = await APIService(authClient).getReservations();
      _reservations = res;
      notifyListeners();
      return true;
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<void> deleteReservation(Dio authClient, ReservationDTO reservation) async {
    try {
      await APIService(authClient).deleteReservation(reservation.id);
      await getReservations(authClient);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
