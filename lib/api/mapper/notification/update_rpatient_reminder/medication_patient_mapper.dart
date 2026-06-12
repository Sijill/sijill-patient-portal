import 'package:sijil_patient_portal/api/model/notfication/response/update_patient_reminders_response/medication_patient_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/update_patient_reminders_response/medication_patient.dart';

extension MedicationPatientMapper on MedicationPatientDto {
  MedicationPatient convertToMedicationPatient() {
    return MedicationPatient(
      dosageAmount: dosageAmount,
      medicationId: medicationId,
    );
  }
}
