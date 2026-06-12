import 'package:sijil_patient_portal/api/model/notfication/response/list_active_patient_reminders_response/medical_order_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/medical_order.dart';

extension MedicalOrdersMapper on MedicalOrderDto {
  MedicalOrder convertToMedicalOrder() {
    return MedicalOrder(
      medicalOrderId: medicalOrderId,
      orderName: orderName,
      priority: priority,
      orderType: orderType,
      orderedAt: orderedAt,
      bodyPart: bodyPart,
      orderedBy: orderedBy,
      status: status,
      specimenType: specimenType,
    );
  }
}
