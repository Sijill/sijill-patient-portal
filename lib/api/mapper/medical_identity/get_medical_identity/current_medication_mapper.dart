import 'package:sijil_patient_portal/api/model/medical_identity/response/get_medical_identity/current_medication_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/current_medication.dart';

extension CurrentMedicationMapper on CurrentMedicationDto {
  CurrentMedication convertToCurrentMedication() {
    return CurrentMedication(
      dosageAmount: dosageAmount,
      dosageUnit: dosageUnit,
      endDate: endDate,
      form: form,
      frequency: frequency,
      medicationName: medicationName,
      prescribedAt: prescribedAt,
      prescribedBy: prescribedBy,
      startDate: startDate,
    );
  }
}
