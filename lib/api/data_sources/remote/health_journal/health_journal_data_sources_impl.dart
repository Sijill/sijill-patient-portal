import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/mapper/health_journal/get_health_journal_diagonses/get_health_journal_diagonses_response_mapper.dart';
import 'package:sijil_patient_portal/api/web_service.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/health_journal/health_journal_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_diagonses/get_health_journal_diagonses_response.dart';

@Injectable(as: HealthJournalDataSources)
class HealthJournalDataSourcesImpl extends HealthJournalDataSources {
  WebService webService;
  HealthJournalDataSourcesImpl({required this.webService});
  @override
  Future<GetHealthJournalDiagonsesResponse> getHealthJournalDiagonses() async {
    final getHealthJournalDiagonsesResponseDto = await webService
        .getHealthJournalDiagonses();
    //todo:GetHealthJournalDiagonsesResponseDto => GetHealthJournalDiagonsesResponse
    return getHealthJournalDiagonsesResponseDto
        .convertToGetHealthJournalDiagonsesResponse();
  }
}
