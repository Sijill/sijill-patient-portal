import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/health_journal/health_journal_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_diagonses/get_health_journal_diagonses_response.dart';
import 'package:sijil_patient_portal/domain/repositories/health_journal/health_journal_repository.dart';

@Injectable(as: HealthJournalRepository)
class HealthJournalRepositoryImpl extends HealthJournalRepository {
  HealthJournalDataSources healthJournalDataSources;
  HealthJournalRepositoryImpl({required this.healthJournalDataSources});
  @override
  Future<GetHealthJournalDiagonsesResponse> getHealthJournalDiagonses() {
    return healthJournalDataSources.getHealthJournalDiagonses();
  }
}
