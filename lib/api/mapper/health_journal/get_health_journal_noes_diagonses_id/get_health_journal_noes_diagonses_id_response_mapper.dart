import 'package:sijil_patient_portal/api/mapper/health_journal/get_health_journal_noes_diagonses_id/diagonses_note_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/health_journal/get_health_journal_noes_diagonses_id/notes_mapper.dart';
import 'package:sijil_patient_portal/api/model/health_journal/response/get_health_journal_notes_diagones_id_response_dto/get_health_journal_notes_diagones_id_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_notes_diagones_id_response_dto/get_health_journal_notes_diagones_id_response.dart';

extension GetHealthJournalNoesDiagonsesIdResponseMapper
    on GetHealthJournalNotesDiagonesIdResponseDto {
  GetHealthJournalNotesDiagonesIdResponse
  covertToGetHealthJournalDiagonsesResponse() {
    return GetHealthJournalNotesDiagonesIdResponse(
      diagnosis: diagnosis?.convertToDiagnosisNote(),
      notes: notes?.map((e) => e.covertToNote()).toList(),
    );
  }
}
