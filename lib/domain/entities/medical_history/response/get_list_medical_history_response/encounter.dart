import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_list_medical_history_response/primary_diagnosis.dart';

class Encounter {
  String? encounterId;
  String? doctorName;
  String? doctorSpeciality;
  DateTime? encounterDate;
  String? location;
  PrimaryDiagnosis? primaryDiagnosis;

  Encounter({
    this.encounterId,
    this.doctorName,
    this.doctorSpeciality,
    this.encounterDate,
    this.location,
    this.primaryDiagnosis,
  });
}
