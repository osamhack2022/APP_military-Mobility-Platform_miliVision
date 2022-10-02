import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/model/mobility.dart';
import 'package:military_mobility_platform_frontend/model/mobility_request.dart';

class MobilityListProvider extends ChangeNotifier {
  List<MobilityDTO> _mobilities = [];

  List<MobilityDTO> get mobilities => _mobilities;

  void setup(MobilityRequestResDTO dto) {
    _mobilities = dto.mobilities;
    notifyListeners();
  }
}
