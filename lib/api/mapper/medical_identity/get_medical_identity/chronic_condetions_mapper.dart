import 'package:sijil_patient_portal/api/model/medical_identity/response/get_medical_identity/chronic_condition_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/chronic_condition.dart';

extension ChronicCondetionsMapper on ChronicConditionDto {
  ChronicCondition convertToChronicCondetions() {
    return ChronicCondition(
      diagnosedBy: diagnosedBy,
      diagnosedDate: diagnosedDate,
      diagnosisId: diagnosisId,
      icd11Code: icd11Code,
      icd11Title: icd11Title,
    );
  }
}
