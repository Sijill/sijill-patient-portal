import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_diagonses/get_health_journal_diagonses_response.dart';

abstract class HealthJournalDataSources {
  Future<GetHealthJournalDiagonsesResponse> getHealthJournalDiagonses();
}
