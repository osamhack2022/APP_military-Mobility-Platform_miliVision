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
