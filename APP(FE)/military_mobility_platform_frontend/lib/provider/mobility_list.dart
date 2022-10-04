import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/model/mobility.dart';
import 'package:military_mobility_platform_frontend/service/api.dart';
import 'package:military_mobility_platform_frontend/service/toast.dart';

class MobilityListProvider extends ChangeNotifier {
  List<MobilityDTO> _mobilities = [];

  List<MobilityDTO> get mobilities => _mobilities;

  void setup(MobilityRequestResDTO dto) {
    _mobilities = dto.mobilities;
    notifyListeners();
  }
}

class RequestedMobilityListProvider extends ChangeNotifier {
  List<RequestedMobilityDTO> _mobilities = [];

  List<RequestedMobilityDTO> get mobilities => _mobilities;

  void request() async {
    final res = await APIService.requestedMobilitiesList();
    if (res == null) {
      Toast.showFailToast("배차 목록을 불러오는 데 실패했습니다.");
      _mobilities = [];
    } else {
      _mobilities = res.mobilities;
    }
    notifyListeners();
  }
}
