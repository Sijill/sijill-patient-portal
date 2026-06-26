import 'package:sijil_patient_portal/api/mapper/home_tab/name_mapper.dart';
import 'package:sijil_patient_portal/api/model/home_tab/response/patient_name/patient_name_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/patient_name/patient_name_response.dart';

extension PatientNameResponseMapper on PatientNameResponseDto {
  PatientNameResponse convertToPatientNameResponse() {
    return PatientNameResponse(name: name?.convertToName());
  }
}
