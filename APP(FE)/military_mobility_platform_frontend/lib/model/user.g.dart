// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      battalion_id: json['battalion_id'] as String,
      email: json['email'] as String,
      login_id: json['login_id'] as String,
      permission: json['permission'] as int,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'battalion_id': instance.battalion_id,
      'email': instance.email,
      'login_id': instance.login_id,
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
      login_id: json['login_id'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      battalion_id: json['battalion_id'] as String,
    );

Map<String, dynamic> _$RegisterReqDTOToJson(RegisterReqDTO instance) =>
    <String, dynamic>{
      'login_id': instance.login_id,
      'password': instance.password,
      'email': instance.email,
      'battalion_id': instance.battalion_id,
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
      login_id: json['login_id'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginReqDTOToJson(LoginReqDTO instance) =>
    <String, dynamic>{
      'login_id': instance.login_id,
      'password': instance.password,
    };

LoginResDTO _$LoginResDTOFromJson(Map<String, dynamic> json) => LoginResDTO(
      token: TokenDTO.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResDTOToJson(LoginResDTO instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
