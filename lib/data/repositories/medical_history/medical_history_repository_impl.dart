import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/medical_history/medical_history_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_list_medical_history_response/get_list_medical_history_response.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/get_medical_history_response.dart';
import 'package:sijil_patient_portal/domain/repositories/medical_history/medical_history_repository.dart';

@Injectable(as: MedicalHistoryRepository)
class MedicalHistoryRepositoryImpl extends MedicalHistoryRepository {
  MedicalHistoryDataSources medicalHistoryDataSources;
  MedicalHistoryRepositoryImpl({required this.medicalHistoryDataSources});
  @override
  Future<GetListMedicalHistoryResponse> getListMedicalHistory() {
    return medicalHistoryDataSources.getListMedicalHistory();
  }

  @override
  Future<GetMedicalHistoryResponse> getMedicalHistory({
    required String encounterId,
  }) {
    return medicalHistoryDataSources.getMedicalHistory(
      encounterId: encounterId,
    );
  }
}
