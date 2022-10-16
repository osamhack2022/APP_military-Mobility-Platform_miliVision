import 'package:json_annotation/json_annotation.dart';

part 'operation.g.dart';

@JsonSerializable()
class OperationDTO {
    const OperationDTO(
        {required this.reservation_id,
         required this.safety_checklist,
         required this.operation_plan});
    
    final int reservation_id;
    final bool safety_checklist;
    final String operation_plan;
  
  factory OperationDTO.fromJson(Map<String, dynamic> json) =>
      _$OperationDTOFromJson(json);
  Map<String, dynamic> toJson() => _$OperationDTOToJson(this);
}
