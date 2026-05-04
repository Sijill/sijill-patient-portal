import 'package:sijil_patient_portal/api/model/medical_identity/response/get_medical_identity/active_diagnosis_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/active_diagnosis.dart';

extension ActiveDiagnosesMapper on ActiveDiagnosisDto {
  ActiveDiagnosis converToActiveDiagnosis() {
    return ActiveDiagnosis(
      diagnosedBy: diagnosedBy,
      diagnosedDate: diagnosedDate,
      diagnosisId: diagnosisId,
      icd11Code: icd11Code,
      icd11Title: icd11Title,
    );
  }
}
