import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_diagonses/get_health_journal_diagonses_response.dart';
import 'package:sijil_patient_portal/domain/repositories/health_journal/health_journal_repository.dart';

@injectable
class GetHealthJournalDiagonseUseCase {
  HealthJournalRepository healthJournalRepository;
  GetHealthJournalDiagonseUseCase({required this.healthJournalRepository});
  Future<GetHealthJournalDiagonsesResponse> invoke() {
    return healthJournalRepository.getHealthJournalDiagonses();
  }
}
