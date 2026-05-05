import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_notes/diagnosis.dart';

class GetHealthJournalNotesResponse {
  List<Diagnosis>? diagnoses;

  GetHealthJournalNotesResponse({this.diagnoses});
}
