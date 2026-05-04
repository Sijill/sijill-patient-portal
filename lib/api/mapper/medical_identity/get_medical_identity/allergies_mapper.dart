import 'package:sijil_patient_portal/api/model/medical_identity/response/get_medical_identity/allergy_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/allergy.dart';

extension AllergiesMapper on AllergyDto {
  Allergy convertToAllergy() {
    return Allergy(
      allergenName: allergenName,
      diagnosedBy: diagnosedBy,
      diagnosedDate: diagnosedDate,
      icd11Title: icd11Title,
      reactionDescription: reactionDescription,
      severity: severity,
    );
  }
}
