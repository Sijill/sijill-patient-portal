import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/delete_emergency_contact/delete_emergency_contact_response.dart';
import 'package:sijil_patient_portal/domain/repositories/medical_identity/medical_identity_repository.dart';

@injectable
class DeleteEmergencyContactUseCase {
  MedicalIdentityRepository medicalIdentityRepository;
  DeleteEmergencyContactUseCase({required this.medicalIdentityRepository});
  Future<DeleteEmergencyContactResponse> invoke({required String contactId}) {
    return medicalIdentityRepository.deleteEmergencyContact(
      contactId: contactId,
    );
  }
}
