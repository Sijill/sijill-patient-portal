import 'package:sijil_patient_portal/api/model/medical_history/response/get_medical_history_response_dto/diagnosis_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/diagnosis.dart';

extension DiagnosesMapper on DiagnosisDto {
  Diagnosis convertToDiagnosis() {
    return Diagnosis(
      clinicalDescription: clinicalDescription,
      icd11Code: icd11Code,
      icd11Title: icd11Title,
    );
  }
}
