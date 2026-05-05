import 'package:json_annotation/json_annotation.dart';

import 'entry_dto.dart';
import 'health_snapshot_dto.dart';

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
