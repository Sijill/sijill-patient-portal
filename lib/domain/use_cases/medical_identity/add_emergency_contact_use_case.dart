import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/add_emergency_contact/add_emergency_contact_request.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/add_emergency_contact/add_emergency_contact_response.dart';
import 'package:sijil_patient_portal/domain/repositories/medical_identity/medical_identity_repository.dart';

@injectable
class AddEmergencyContactUseCase {
  MedicalIdentityRepository medicalIdentityRepository;
  AddEmergencyContactUseCase({required this.medicalIdentityRepository});
  Future<AddEmergencyContactResponse> invoke({
    required AddEmergencyContactRequest addEmergencyContactRequest,
  }) {
    return medicalIdentityRepository.addEmergencyContact(
      addEmergencyContactRequest: addEmergencyContactRequest,
    );
  }
}
