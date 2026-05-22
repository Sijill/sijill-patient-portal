import 'package:sijil_patient_portal/api/mapper/medical_history/get_medical_history/encounter_mapper.dart';
import 'package:sijil_patient_portal/api/model/medical_history/response/get_medical_history_response_dto/get_medical_history_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/get_medical_history_response.dart';

extension GetMedicalHistoryResponseMapper on GetMedicalHistoryResponseDto {
  GetMedicalHistoryResponse convertToGetMedicalHistoryResponse() {
    return GetMedicalHistoryResponse(
      encounter: encounter?.convertToEncounter(),
    );
  }
}
