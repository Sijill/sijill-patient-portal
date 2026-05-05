import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/request/health_journal_notes_requst.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/health_journal_notes/health_journal_notes_response.dart';
import 'package:sijil_patient_portal/domain/repositories/health_journal/health_journal_repository.dart';

@injectable
class HealthJournalNotesUseCase {
  HealthJournalRepository healthJournalRepository;
  HealthJournalNotesUseCase({required this.healthJournalRepository});
  Future<HealthJournalNotesResponse> invoke({
    required HealthJournalNotesRequst healthJournalNotesRequst,
  }) {
    return healthJournalRepository.healthJournalNotes(
      healthJournalNotesRequst: healthJournalNotesRequst,
    );
  }
}
