import 'package:sijil_patient_portal/api/mapper/medical_history/get_list_medical_history/encounters_mapper.dart';
import 'package:sijil_patient_portal/api/model/medical_history/response/get_list_medical_history_response/get_list_medical_history_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_list_medical_history_response/get_list_medical_history_response.dart';

extension GetListMedicalHistoryResponseMapper
    on GetListMedicalHistoryResponseDto {
  GetListMedicalHistoryResponse convertToGetListMedicalHistoryResponse() {
    return GetListMedicalHistoryResponse(
      encounters: encounters?.map((e) => e.convertToEncounter()).toList(),
    );
  }
}
