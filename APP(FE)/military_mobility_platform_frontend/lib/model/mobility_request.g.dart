// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobility_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      (json['mobilities'] as List<dynamic>)
          .map((e) => MobilityDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MobilityRequestResDTOToJson(
        MobilityRequestResDTO instance) =>
    <String, dynamic>{
      'mobilities': instance.mobilities,
    };
