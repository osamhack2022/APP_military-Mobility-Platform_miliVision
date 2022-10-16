// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationDTO _$OperationDTOFromJson(Map<String, dynamic> json) => OperationDTO(
      reservation_id: json['reservation_id'] as int,
      safety_checklist: json['safety_checklist'] as bool,
      operation_plan: json['operation_plan'] as String,
    );

Map<String, dynamic> _$OperationDTOToJson(OperationDTO instance) =>
    <String, dynamic>{
      'reservation_id': instance.reservation_id,
      'safety_checklist': instance.safety_checklist,
      'operation_plan': instance.operation_plan,
    };
