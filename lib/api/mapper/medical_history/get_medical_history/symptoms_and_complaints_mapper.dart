import 'package:sijil_patient_portal/api/model/medical_history/response/get_medical_history_response_dto/symptoms_and_complaints_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/symptoms_and_complaints.dart';

extension SymptomsAndComplaintsMapper on SymptomsAndComplaintsDto {
  SymptomsAndComplaints convertToSymptomsAndComplaints() {
    return SymptomsAndComplaints(title: title, description: description);
  }
}
