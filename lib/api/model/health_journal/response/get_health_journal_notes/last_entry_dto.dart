import 'package:json_annotation/json_annotation.dart';

part 'last_entry_dto.g.dart';

@JsonSerializable()
class LastEntryDto {
  String? patientOutcome;
  int? painLevel;
  int? energyLevel;
  String? mood;
  DateTime? createdAt;

  LastEntryDto({
    this.patientOutcome,
    this.painLevel,
    this.energyLevel,
    this.mood,
    this.createdAt,
  });

  factory LastEntryDto.fromJson(Map<String, dynamic> json) {
    return _$LastEntryDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LastEntryDtoToJson(this);
}
