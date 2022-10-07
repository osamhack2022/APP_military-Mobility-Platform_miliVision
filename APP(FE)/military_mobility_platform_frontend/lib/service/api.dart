import 'dart:convert';

import 'package:military_mobility_platform_frontend/model/mobility.dart';
import 'package:military_mobility_platform_frontend/model/user.dart';
import 'package:http/http.dart' as http;

class APIService {
  static const kBaseUrl = '34.105.35.232:8000';

  static TokenDTO? _token;
  static void setUserToken(TokenDTO token) => _token = token;
  static void removeUserToken() => _token = null;

  static Future<LoginResDTO?> login(LoginReqDTO dto) async {
    final url = Uri.http(kBaseUrl, 'user/login/');
    final response = await http.post(url, body: dto.toJson());
    if (response.statusCode != 200) {
      return null;
    } else {
      final body = jsonDecode(response.body);
      return LoginResDTO.fromJson(body);
    }
  }

  static Future<RegisterResDTO?> register(RegisterReqDTO dto) async {
    final url = Uri.http(kBaseUrl, 'user/register/');
    final response = await http.post(url, body: dto.toJson());
    if (response.statusCode != 200) {
      return null;
    } else {
      final body = jsonDecode(response.body);
      return RegisterResDTO.fromJson(body);
    }
  }

  static Future<MobilityRequestResDTO?> requestMobilities(
      MobilityRequestReqDTO dto) async {
    const list = [
      MobilityDTO(id: '12하8839', type: 'K3', fuelType: '휘발유', color: '블루'),
      MobilityDTO(id: '12하8829', type: '상용1톤', fuelType: '휘발유', color: '블루'),
      MobilityDTO(id: '12하8833', type: '승합차', fuelType: '휘발유', color: '그레이'),
      MobilityDTO(id: '12하8872', type: 'K3', fuelType: '휘발유', color: '블랙'),
    ];
    return const MobilityRequestResDTO(mobilities: list);
  }

  static Future<RequestedMobilityListResDTO?> requestedMobilitiesList() async {
    final list = [
      RequestedMobilityDTO(
          mobility: const MobilityDTO(
              id: '12하8839', type: 'K3', fuelType: '휘발유', color: '블루'),
          waiting: false,
          accepted: true,
          departureTime: DateTime(2022, 9, 10, 9),
          arrivalTime: DateTime(2022, 9, 20, 11)),
      RequestedMobilityDTO(
          mobility: const MobilityDTO(
              id: '12하8829', type: '상용1톤', fuelType: '휘발유', color: '블루'),
          waiting: false,
          accepted: false,
          departureTime: DateTime(2022, 9, 12, 11),
          arrivalTime: DateTime(2022, 9, 12, 13)),
      RequestedMobilityDTO(
          mobility: const MobilityDTO(
              id: '12하8833', type: '승합차', fuelType: '휘발유', color: '그레이'),
          waiting: true,
          accepted: false,
          departureTime: DateTime(2022, 9, 12, 11),
          arrivalTime: DateTime(2022, 9, 12, 13)),
    ];
    return RequestedMobilityListResDTO(mobilities: list);
  }
}
