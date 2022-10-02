import 'package:json_annotation/json_annotation.dart';
import 'package:military_mobility_platform_frontend/model/mobility.dart';

part 'mobility_request.g.dart';

@JsonSerializable()
class MobilityRequestReqDTO {
  const MobilityRequestReqDTO(
      {required this.departure,
      required this.destination,
      required this.drivers,
      required this.seniorPassengers,
      required this.passengers});

  final String departure;
  final String destination;
  final int drivers;
  final int seniorPassengers;
  final int passengers;

  Map<String, dynamic> toJson() => _$MobilityRequestReqDTOToJson(this);
}

@JsonSerializable()
class MobilityRequestResDTO {
  final List<MobilityDTO> mobilities;

  const MobilityRequestResDTO(this.mobilities);

  factory MobilityRequestResDTO.fromJson(Map<String, dynamic> json) =>
      _$MobilityRequestResDTOFromJson(json);
}
