import 'package:sijil_patient_portal/api/model/notfication/response/list_active_patient_reminders_response/medication_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/medication.dart';

extension MedicationsMapper on MedicationDto {
  Medication convertToMedication() {
    return Medication(
      dosageAmount: dosageAmount,
      dosageUnit: dosageUnit,
      endDate: endDate,
      form: form,
      frequency: frequency,
      medicationId: medicationId,
      name: name,
      prescribedBy: prescribedBy,
      startDate: startDate,
    );
  }
}
