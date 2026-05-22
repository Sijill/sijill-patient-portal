import 'package:sijil_patient_portal/api/model/medical_history/response/get_medical_history_response_dto/prescribed_medication_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/prescribed_medication.dart';

extension PrescribedMedicationsMapper on PrescribedMedicationDto {
  PrescribedMedication convertToPrescribedMedication() {
    return PrescribedMedication(
      dosageAmount: dosageAmount,
      dosageUnit: dosageUnit,
      endDate: endDate,
      form: form,
      frequency: frequency,
      instructions: instructions,
      medicationName: medicationName,
      startDate: startDate,
    );
  }
}
