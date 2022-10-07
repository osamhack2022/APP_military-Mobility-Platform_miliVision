import 'package:json_annotation/json_annotation.dart';

part 'mobility.g.dart';

@JsonSerializable()
class MobilityDTO {
  const MobilityDTO(
      {required this.id,
      required this.type,
      required this.fuelType,
      required this.color});

  final String id;
  final String type;
  final String fuelType;
  final String color;

  factory MobilityDTO.fromJson(Map<String, dynamic> json) =>
      _$MobilityDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MobilityDTOToJson(this);
}

@JsonSerializable()
class RequestedMobilityDTO {
  const RequestedMobilityDTO(
      {required this.mobility,
      required this.waiting,
      required this.accepted,
      required this.departureTime,
      required this.arrivalTime});

  final MobilityDTO mobility;
  final bool waiting;
  final bool accepted;
  final DateTime departureTime;
  final DateTime arrivalTime;

  factory RequestedMobilityDTO.fromJson(Map<String, dynamic> json) =>
      _$RequestedMobilityDTOFromJson(json);
  Map<String, dynamic> toJson() => _$RequestedMobilityDTOToJson(this);
}

@JsonSerializable()
class MobilityRequestReqDTO {
  const MobilityRequestReqDTO(
      {required this.departure,
      required this.destination,
      required this.passengers});

  final String departure;
  final String destination;
  final int passengers;

  Map<String, dynamic> toJson() => _$MobilityRequestReqDTOToJson(this);
}

@JsonSerializable()
class MobilityRequestResDTO {
  const MobilityRequestResDTO({required this.mobilities});

  final List<MobilityDTO> mobilities;

  factory MobilityRequestResDTO.fromJson(Map<String, dynamic> json) =>
      _$MobilityRequestResDTOFromJson(json);
}

@JsonSerializable()
class RequestedMobilityListResDTO {
  const RequestedMobilityListResDTO({required this.mobilities});

  final List<RequestedMobilityDTO> mobilities;

  factory RequestedMobilityListResDTO.fromJson(Map<String, dynamic> json) =>
      _$RequestedMobilityListResDTOFromJson(json);
}
