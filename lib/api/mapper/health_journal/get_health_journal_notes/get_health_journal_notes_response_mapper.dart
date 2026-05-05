import 'package:sijil_patient_portal/api/mapper/health_journal/get_health_journal_notes/diagonses_mapper.dart';
import 'package:sijil_patient_portal/api/model/health_journal/response/get_health_journal_notes/get_health_journal_notes_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_notes/get_health_journal_notes_response.dart';

extension GetHealthJournalNotesResponseMapper
    on GetHealthJournalNotesResponseDto {
  GetHealthJournalNotesResponse convertToGetHealthJournalNotesResponse() {
    return GetHealthJournalNotesResponse(
      diagnoses: diagnoses?.map((e) => e.convertToDiagnosis()).toList(),
    );
  }
}
