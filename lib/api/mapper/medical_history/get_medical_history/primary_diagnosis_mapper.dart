import 'package:sijil_patient_portal/api/model/medical_history/response/get_medical_history_response_dto/primary_diagnosis_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/primary_diagnosis.dart';

extension PrimaryDiagnosisMapper on PrimaryDiagnosisDto {
  PrimaryDiagnosis convertToPrimaryDiagnosis() {
    return PrimaryDiagnosis(icd11Code: icd11Code, icd11Title: icd11Title);
  }
}
