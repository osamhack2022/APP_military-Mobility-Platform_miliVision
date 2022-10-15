// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      battalionID: json['battalion_id'] as String,
      email: json['email'] as String,
      loginID: json['login_id'] as String,
      permission: json['permission'] as int,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'battalion_id': instance.battalionID,
      'email': instance.email,
      'login_id': instance.loginID,
      'permission': instance.permission,
    };

TokenDTO _$TokenDTOFromJson(Map<String, dynamic> json) => TokenDTO(
      access: json['access'] as String,
      refresh: json['refresh'] as String,
    );

Map<String, dynamic> _$TokenDTOToJson(TokenDTO instance) => <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };

RegisterReqDTO _$RegisterReqDTOFromJson(Map<String, dynamic> json) =>
    RegisterReqDTO(
      loginID: json['login_id'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      battalionID: json['battalion_id'] as String,
      permission: json['permission'] as int,
      isStaff: json['is_staff'] as bool? ?? false,
    );

Map<String, dynamic> _$RegisterReqDTOToJson(RegisterReqDTO instance) =>
    <String, dynamic>{
      'login_id': instance.loginID,
      'password': instance.password,
      'email': instance.email,
      'battalion_id': instance.battalionID,
      'permission': instance.permission,
      'is_staff': instance.isStaff,
    };

RegisterResDTO _$RegisterResDTOFromJson(Map<String, dynamic> json) =>
    RegisterResDTO(
      token: TokenDTO.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResDTOToJson(RegisterResDTO instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

LoginReqDTO _$LoginReqDTOFromJson(Map<String, dynamic> json) => LoginReqDTO(
      loginID: json['login_id'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginReqDTOToJson(LoginReqDTO instance) =>
    <String, dynamic>{
      'login_id': instance.loginID,
      'password': instance.password,
    };

LoginResDTO _$LoginResDTOFromJson(Map<String, dynamic> json) => LoginResDTO(
      token: TokenDTO.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResDTOToJson(LoginResDTO instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
