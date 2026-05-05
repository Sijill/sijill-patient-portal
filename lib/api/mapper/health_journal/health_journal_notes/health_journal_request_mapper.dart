import 'package:sijil_patient_portal/api/model/health_journal/request/health_journal_notes/health_journal_notes_requst_dto.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/request/health_journal_notes_requst.dart';

extension HealthJournalRequestMapper on HealthJournalNotesRequst {
  HealthJournalNotesRequstDto convertToHealthJournalNotesRequstDto() {
    return HealthJournalNotesRequstDto(
      diagnosisId: diagnosisId,
      energyLevel: energyLevel,
      mood: mood,
      painLevel: painLevel,
      patientOutcome: patientOutcome,
      patientOutcomeDetails: patientOutcomeDetails,
    );
  }
}
