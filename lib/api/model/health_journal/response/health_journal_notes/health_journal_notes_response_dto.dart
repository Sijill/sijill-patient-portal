import 'package:json_annotation/json_annotation.dart';
import 'package:sijil_patient_portal/api/model/health_journal/response/health_journal_notes/health_snapshot_dto.dart';

import 'entry_dto.dart';

part 'health_journal_notes_response_dto.g.dart';

@JsonSerializable()
class HealthJournalNotesResponseDto {
  EntryDto? entry;
  HealthSnapshotDto? healthSnapshot;

  HealthJournalNotesResponseDto({this.entry, this.healthSnapshot});

  factory HealthJournalNotesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$HealthJournalNotesResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HealthJournalNotesResponseDtoToJson(this);
}
