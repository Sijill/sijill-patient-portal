import 'package:sijil_patient_portal/api/model/health_journal/response/get_health_journal_notes_diagones_id_response_dto/diagnosis_note_dto.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_notes_diagones_id_response_dto/diagnosis_note.dart';

extension DiagonsesNoteMapper on DiagnosisNoteDto {
  DiagnosisNote convertToDiagnosisNote() {
    return DiagnosisNote(
      diagnosisId: diagnosisId,
      icd11Code: icd11Code,
      icd11Title: icd11Title,
      isChronic: isChronic,
      status: status,
    );
  }
}
