import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_list_medical_history_response/get_list_medical_history_response.dart';

import 'package:sijil_patient_portal/domain/repositories/medical_history/medical_history_repository.dart';

@injectable
class GetListMedicalHistoryUseCase {
  MedicalHistoryRepository medicalHistoryRepository;
  GetListMedicalHistoryUseCase({required this.medicalHistoryRepository});
  Future<GetListMedicalHistoryResponse> invoke() {
    return medicalHistoryRepository.getListMedicalHistory();
  }
}
