import 'package:sijil_patient_portal/api/model/notfication/response/list_active_patient_reminders_response/appointment_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/appointment.dart';

extension AppointmentsMapper on AppointmentDto {
  Appointment convertToAppointment() {
    return Appointment(
      doctorName: doctorName,
      location: location,
      encounterId: encounterId,
      notes: notes,
    );
  }
}
