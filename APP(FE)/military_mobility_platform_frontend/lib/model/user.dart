import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserDTO {
  const UserDTO(
      {required this.battalion_id,
      required this.email,
      required this.login_id,
      required this.permission});

  final String battalion_id;
  final String email;
  final String login_id;
  final int permission;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}

@JsonSerializable()
class TokenDTO {
  const TokenDTO({required this.access, required this.refresh});

  final String access;
  final String refresh;

  factory TokenDTO.fromJson(Map<String, dynamic> json) =>
      _$TokenDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TokenDTOToJson(this);
}

@JsonSerializable()
class RegisterReqDTO {
  const RegisterReqDTO(
      {required this.login_id,
      required this.password,
      required this.email,
      required this.battalion_id});

  final String login_id;
  final String password;
  final String email;
  final String battalion_id;

  Map<String, dynamic> toJson() => _$RegisterReqDTOToJson(this);
}

@JsonSerializable()
class RegisterResDTO {
  const RegisterResDTO({required this.token});

  final TokenDTO token;

  factory RegisterResDTO.fromJson(Map<String, dynamic> json) =>
      _$RegisterResDTOFromJson(json);
}

@JsonSerializable()
class LoginReqDTO {
  const LoginReqDTO({
    required this.login_id,
    required this.password,
  });

  final String login_id;
  final String password;

  Map<String, dynamic> toJson() => _$LoginReqDTOToJson(this);
}

@JsonSerializable()
class LoginResDTO {
  const LoginResDTO({required this.token});

  final TokenDTO token;

  factory LoginResDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginResDTOFromJson(json);
}
