import 'package:json_annotation/json_annotation.dart';

part 'mobility.g.dart';

@JsonSerializable()
class MobilityDTO {
  const MobilityDTO(
      {required this.id,
      required this.type,
      required this.fuelType,
      required this.color});

  final int id;
  @JsonKey(name: 'car_model')
  final String type;
  @JsonKey(name: 'propulsion_type')
  final String fuelType;
  final String color;

  factory MobilityDTO.fromJson(Map<String, dynamic> json) =>
      _$MobilityDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MobilityDTOToJson(this);
}

@JsonSerializable()
class GetAvailableMobilitiesReqDTO {
  const GetAvailableMobilitiesReqDTO(
      {required this.passengers,
      required this.departureTime,
      required this.arrivalTime});

  @JsonKey(name: 'followers_num')
  final int passengers;
  @JsonKey(name: 'reservation_start')
  final DateTime departureTime;
  @JsonKey(name: 'reservation_end')
  final DateTime arrivalTime;

  Map<String, dynamic> toJson() => _$GetAvailableMobilitiesReqDTOToJson(this);
}

typedef GetAvailableMobilitiesResDTO = List<MobilityDTO>;
