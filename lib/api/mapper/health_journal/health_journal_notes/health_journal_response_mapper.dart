import 'package:sijil_patient_portal/api/mapper/health_journal/health_journal_notes/entry_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/health_journal/health_journal_notes/health_snapshot_mapper.dart';
import 'package:sijil_patient_portal/api/model/health_journal/response/health_journal_notes/health_journal_notes_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/health_journal_notes/health_journal_notes_response.dart';

extension HealthJournalResponseMapper on HealthJournalNotesResponseDto {
  HealthJournalNotesResponse convertToHealthJournalNotesResponse() {
    return HealthJournalNotesResponse(
      entry: entry?.convertToEntry(),
      healthSnapshot: healthSnapshot?.convertToHealthSnapshot(),
    );
  }
}
