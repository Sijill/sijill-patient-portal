import 'package:sijil_patient_portal/api/model/medical_identity/response/delete_emergency_contact/delete_emergency_contact_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/delete_emergency_contact/delete_emergency_contact_response.dart';

extension DeleteEmergencyContactResponseMapper
    on DeleteEmergencyContactResponseDto {
  DeleteEmergencyContactResponse convertToDeleteEmergencyContactResponse() {
    return DeleteEmergencyContactResponse(
      message: message,
      statusCode: statusCode,
      error: error,
    );
  }
}
