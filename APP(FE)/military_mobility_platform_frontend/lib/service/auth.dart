import 'package:military_mobility_platform_frontend/model/register.dart';

class AuthService {
  const AuthService();

  static String? login(String id, String password) {
    return '$id-$password';
  }

  static bool register(RegisterReqDTO dto) {
    print(dto.toJson());
    return true;
  }
}
