import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_notes_diagones_id_response_dto/get_health_journal_notes_diagones_id_response.dart';
import 'package:sijil_patient_portal/domain/repositories/health_journal/health_journal_repository.dart';

@injectable
class GetHealthJournalNotesDiagonseIdUseCase {
  HealthJournalRepository healthJournalRepository;
  GetHealthJournalNotesDiagonseIdUseCase({
    required this.healthJournalRepository,
  });
  Future<GetHealthJournalNotesDiagonesIdResponse> invoke({
    required String diagnosisId,
  }) {
    return healthJournalRepository.getHealthJournalNotesDiagonsesId(
      diagnosisId: diagnosisId,
    );
  }
}
