import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()
class RegisterReqDTO {
  const RegisterReqDTO(
      {required this.id,
      required this.password,
      required this.grade,
      required this.baseName,
      required this.role});

  final String id;
  final String password;
  final String grade;
  final String baseName;
  final String role;

  Map<String, dynamic> toJson() => _$RegisterReqDTOToJson(this);
}
