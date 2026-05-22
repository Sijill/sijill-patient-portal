import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_list_medical_history_response/get_list_medical_history_response.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/get_medical_history_response.dart';

abstract class MedicalHistoryDataSources {
  Future<GetListMedicalHistoryResponse> getListMedicalHistory();
  Future<GetMedicalHistoryResponse> getMedicalHistory({
    required String encounterId,
  });
}
