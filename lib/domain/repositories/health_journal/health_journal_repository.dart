import 'package:sijil_patient_portal/domain/entities/health_journal/request/health_journal_notes_requst.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_diagonses/get_health_journal_diagonses_response.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/health_journal_notes/health_journal_notes_response.dart';

abstract class HealthJournalRepository {
  Future<GetHealthJournalDiagonsesResponse> getHealthJournalDiagonses();
  Future<HealthJournalNotesResponse> healthJournalNotes({
    required HealthJournalNotesRequst healthJournalNotesRequst,
  });
}
