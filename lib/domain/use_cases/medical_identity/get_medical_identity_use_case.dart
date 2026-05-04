import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/get_medical_identity_response_dto.dart';
import 'package:sijil_patient_portal/domain/repositories/medical_identity/medical_identity_repository.dart';

@injectable
class GetMedicalIdentityUseCase {
  MedicalIdentityRepository medicalIdentityRepository;
  GetMedicalIdentityUseCase({required this.medicalIdentityRepository});
  Future<GetMedicalIdentityResponse> invoke() {
    return medicalIdentityRepository.getMedicalIdentity();
  }
}
