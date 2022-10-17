import 'package:json_annotation/json_annotation.dart';

part 'accident.g.dart';

@JsonSerializable()
class AccidentDTO {
    const AccidentDTO(
        {required this.car,
         this.incident_type,
         required this.location,
         this.image
         });
    
    final int car;
    final String incident_type;
    final String location;
    final String image;
  
  factory AccidentDTO.fromJson(Map<String, dynamic> json) =>
      _$AccidentDTOFromJson(json);
  Map<String, dynamic> toJson() => _$AccidentDTOToJson(this);
}
