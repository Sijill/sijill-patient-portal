import 'package:sijil_patient_portal/api/mapper/notification/reminders/appointments_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/notification/reminders/medical_orders_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/notification/reminders/medications_mapper.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/list_active_patient_reminders_response/grouped_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/grouped.dart';

extension GroupedMapper on GroupedDto {
  Grouped convertToGrouped() {
    return Grouped(
      appointments: appointments?.map((e) => e.convertToAppointment()).toList(),
      medications: medications?.map((e) => e.convertToMedication()).toList(),
      medicalOrders: medicalOrders
          ?.map((e) => e.convertToMedicalOrder())
          .toList(),
    );
  }
}
