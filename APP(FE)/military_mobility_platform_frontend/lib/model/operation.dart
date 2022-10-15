import 'package:json_annotation/json_annotation.dart';

part 'operation.g.dart';

@JsonSerializable()
class OperationDTO {
    const OperationDTO(
        {required this.safety_checklist,
        required this.operation_plan,
      });
  
    @JsonKey(name: 'safety_checklist')
    final bool safetyCheck;
    final String operation_plan;
  
  factory OperationDTO.fromJson(Map<String, dynamic> json) =>
      _$OperationDTOFromJson(json);
  Map<String, dynamic> toJson() => _$OperationDTOToJson(this);
}
