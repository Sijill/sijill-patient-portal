import 'package:sijil_patient_portal/api/model/permission_token/response/list_patient_active_lab_order_response/lab_order_dto.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/list_patient_active_lab_order_response/lab_order.dart';

extension LabOrderMapper on LabOrderDto {
  LabOrder convertToLabOrder() {
    return LabOrder(
      clinicalIndication: clinicalIndication,
      fastingRequired: fastingRequired,
      priority: priority,
      specimenType: specimenType,
      testType: testType,
    );
  }
}
