// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterReqDTO _$RegisterReqDTOFromJson(Map<String, dynamic> json) =>
    RegisterReqDTO(
      id: json['id'] as String,
      password: json['password'] as String,
      grade: json['grade'] as String,
      baseName: json['baseName'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$RegisterReqDTOToJson(RegisterReqDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'grade': instance.grade,
      'baseName': instance.baseName,
      'role': instance.role,
    };
