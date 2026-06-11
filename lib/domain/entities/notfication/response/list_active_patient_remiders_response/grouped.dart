import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/appointment.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/medical_order.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/medication.dart';

class Grouped {
  List<Appointment>? appointments;
  List<Medication>? medications;
  List<MedicalOrder>? medicalOrders;

  Grouped({this.appointments, this.medications, this.medicalOrders});
}
