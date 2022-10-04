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

RequestedMobilityDTO _$RequestedMobilityDTOFromJson(
        Map<String, dynamic> json) =>
    RequestedMobilityDTO(
      mobility: MobilityDTO.fromJson(json['mobility'] as Map<String, dynamic>),
      waiting: json['waiting'] as bool,
      accepted: json['accepted'] as bool,
      departureTime: DateTime.parse(json['departureTime'] as String),
      arrivalTime: DateTime.parse(json['arrivalTime'] as String),
    );

Map<String, dynamic> _$RequestedMobilityDTOToJson(
        RequestedMobilityDTO instance) =>
    <String, dynamic>{
      'mobility': instance.mobility,
      'waiting': instance.waiting,
      'accepted': instance.accepted,
      'departureTime': instance.departureTime.toIso8601String(),
      'arrivalTime': instance.arrivalTime.toIso8601String(),
    };

MobilityRequestReqDTO _$MobilityRequestReqDTOFromJson(
        Map<String, dynamic> json) =>
    MobilityRequestReqDTO(
      departure: json['departure'] as String,
      destination: json['destination'] as String,
      passengers: json['passengers'] as int,
    );

Map<String, dynamic> _$MobilityRequestReqDTOToJson(
        MobilityRequestReqDTO instance) =>
    <String, dynamic>{
      'departure': instance.departure,
      'destination': instance.destination,
      'passengers': instance.passengers,
    };

MobilityRequestResDTO _$MobilityRequestResDTOFromJson(
        Map<String, dynamic> json) =>
    MobilityRequestResDTO(
      mobilities: (json['mobilities'] as List<dynamic>)
          .map((e) => MobilityDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MobilityRequestResDTOToJson(
        MobilityRequestResDTO instance) =>
    <String, dynamic>{
      'mobilities': instance.mobilities,
    };

RequestedMobilityListResDTO _$RequestedMobilityListResDTOFromJson(
        Map<String, dynamic> json) =>
    RequestedMobilityListResDTO(
      mobilities: (json['mobilities'] as List<dynamic>)
          .map((e) => RequestedMobilityDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestedMobilityListResDTOToJson(
        RequestedMobilityListResDTO instance) =>
    <String, dynamic>{
      'mobilities': instance.mobilities,
    };
