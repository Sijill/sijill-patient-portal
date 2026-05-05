import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_notes_diagones_id_response_dto/diagnosis_note.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_notes_diagones_id_response_dto/note.dart';

class GetHealthJournalNotesDiagonesIdResponse {
  DiagnosisNote? diagnosis;
  List<Note>? notes;

  GetHealthJournalNotesDiagonesIdResponse({this.diagnosis, this.notes});
}
