// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      login_id: json['login_id'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      battalion_id: json['battalion_id'] as String,
    );

Map<String, dynamic> _$RegisterResDTOToJson(RegisterResDTO instance) =>
    <String, dynamic>{
      'login_id': instance.login_id,
      'password': instance.password,
      'email': instance.email,
      'battalion_id': instance.battalion_id,
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
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginResDTOToJson(LoginResDTO instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
