import 'package:military_mobility_platform_frontend/model/mobility.dart';
import 'package:military_mobility_platform_frontend/model/mobility_request.dart';
import 'package:military_mobility_platform_frontend/model/register.dart';

class APIService {
  static String? login(String id, String password) {
    return '$id-$password';
  }

  static bool register(RegisterReqDTO dto) {
    print(dto.toJson());
    return true;
  }

  static MobilityRequestResDTO requestMobilities(MobilityRequestReqDTO dto) {
    return const MobilityRequestResDTO([
      MobilityDTO(id: '12하8839', type: 'K3', fuelType: '휘발유', color: '블루'),
      MobilityDTO(id: '12하8829', type: '상용1톤', fuelType: '휘발유', color: '블루'),
      MobilityDTO(id: '12하8833', type: '승합차', fuelType: '휘발유', color: '그레이'),
      MobilityDTO(id: '12하8872', type: 'K3', fuelType: '휘발유', color: '블랙'),
    ]);
  }
}
