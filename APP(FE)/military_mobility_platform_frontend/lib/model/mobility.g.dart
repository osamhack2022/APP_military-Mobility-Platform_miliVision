// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobilityDTO _$MobilityDTOFromJson(Map<String, dynamic> json) => MobilityDTO(
      id: json['id'] as int,
      type: json['car_model'] as String,
      fuelType: json['propulsion_type'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$MobilityDTOToJson(MobilityDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'car_model': instance.type,
      'propulsion_type': instance.fuelType,
      'color': instance.color,
    };

GetAvailableMobilitiesReqDTO _$GetAvailableMobilitiesReqDTOFromJson(
        Map<String, dynamic> json) =>
    GetAvailableMobilitiesReqDTO(
      passengers: json['followers_num'] as int,
      departureTime: DateTime.parse(json['reservation_start'] as String),
      arrivalTime: DateTime.parse(json['reservation_end'] as String),
    );

Map<String, dynamic> _$GetAvailableMobilitiesReqDTOToJson(
        GetAvailableMobilitiesReqDTO instance) =>
    <String, dynamic>{
      'followers_num': instance.passengers,
      'reservation_start': instance.departureTime.toIso8601String(),
      'reservation_end': instance.arrivalTime.toIso8601String(),
    };
