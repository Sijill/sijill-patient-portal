import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/health_journal/health_journal_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_notes/get_health_journal_notes_response.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/request/health_journal_notes_requst.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_diagonses/get_health_journal_diagonses_response.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/health_journal_notes/health_journal_notes_response.dart';
import 'package:sijil_patient_portal/domain/repositories/health_journal/health_journal_repository.dart';

@Injectable(as: HealthJournalRepository)
class HealthJournalRepositoryImpl extends HealthJournalRepository {
  HealthJournalDataSources healthJournalDataSources;
  HealthJournalRepositoryImpl({required this.healthJournalDataSources});
  @override
  Future<GetHealthJournalDiagonsesResponse> getHealthJournalDiagonses() {
    return healthJournalDataSources.getHealthJournalDiagonses();
  }

  @override
  Future<HealthJournalNotesResponse> healthJournalNotes({
    required HealthJournalNotesRequst healthJournalNotesRequst,
  }) {
    return healthJournalDataSources.healthJournalNotes(
      healthJournalNotesRequst: healthJournalNotesRequst,
    );
  }

  @override
  Future<GetHealthJournalNotesResponse> getHealthJournalNotes() {
    return healthJournalDataSources.getHealthJournalNotes();
  }
}
