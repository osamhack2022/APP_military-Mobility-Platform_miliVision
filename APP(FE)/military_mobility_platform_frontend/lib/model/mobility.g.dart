// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobilityDTO _$MobilityDTOFromJson(Map<String, dynamic> json) => MobilityDTO(
      id: json['id'] as String,
      type: json['type'] as String,
      fuelType: json['fuelType'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$MobilityDTOToJson(MobilityDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'fuelType': instance.fuelType,
      'color': instance.color,
    };
