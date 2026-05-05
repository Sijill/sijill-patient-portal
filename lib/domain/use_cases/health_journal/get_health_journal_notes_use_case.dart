import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_notes/get_health_journal_notes_response.dart';
import 'package:sijil_patient_portal/domain/repositories/health_journal/health_journal_repository.dart';

@injectable
class GetHealthJournalNotesUseCase {
  HealthJournalRepository healthJournalRepository;
  GetHealthJournalNotesUseCase({required this.healthJournalRepository});
  Future<GetHealthJournalNotesResponse> invoke() {
    return healthJournalRepository.getHealthJournalNotes();
  }
}
