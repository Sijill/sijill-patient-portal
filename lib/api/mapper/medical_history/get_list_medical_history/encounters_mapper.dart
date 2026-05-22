import 'package:sijil_patient_portal/api/mapper/medical_history/get_list_medical_history/primary_diagonsis_mapper.dart';
import 'package:sijil_patient_portal/api/model/medical_history/response/get_list_medical_history_response/encounter_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_list_medical_history_response/encounter.dart';

extension EncountersMapper on EncounterDto {
  Encounter convertToEncounter() {
    return Encounter(
      doctorName: doctorName,
      doctorSpeciality: doctorSpeciality,
      encounterDate: encounterDate,
      encounterId: encounterId,
      location: location,
      primaryDiagnosis: primaryDiagnosis?.convertToPrimaryDiagnosis(),
    );
  }
}
