import 'package:sijil_patient_portal/api/mapper/health_journal/get_health_journal_diagonses/diagonses_mapper.dart';
import 'package:sijil_patient_portal/api/model/health_journal/response/get_health_journal_diagonses/get_health_journal_diagonses_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_diagonses/get_health_journal_diagonses_response.dart';

extension GetHealthJournalDiagonsesResponseMapper
    on GetHealthJournalDiagonsesResponseDto {
  GetHealthJournalDiagonsesResponse
  convertToGetHealthJournalDiagonsesResponse() {
    return GetHealthJournalDiagonsesResponse(
      diagnoses: diagnoses?.map((e) => e.convertToDiagnosis()).toList(),
    );
  }
}
