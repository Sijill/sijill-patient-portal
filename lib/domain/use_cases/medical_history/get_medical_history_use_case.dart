import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/get_medical_history_response.dart';

import 'package:sijil_patient_portal/domain/repositories/medical_history/medical_history_repository.dart';

@injectable
class GetMedicalHistoryUseCase {
  MedicalHistoryRepository medicalHistoryRepository;
  GetMedicalHistoryUseCase({required this.medicalHistoryRepository});
  Future<GetMedicalHistoryResponse> invoke({required String encounterId}) {
    return medicalHistoryRepository.getMedicalHistory(encounterId: encounterId);
  }
}
