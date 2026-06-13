import 'package:sijil_patient_portal/domain/entities/permission_token/response/list_patient_active_lab_order_response/lab_order.dart';

class Order {
  String? orderId;
  String? orderType;
  String? orderStatus;
  DateTime? orderedAt;
  String? orderedBy;
  String? orderedBySpecialization;
  LabOrder? labOrder;

  Order({
    this.orderId,
    this.orderType,
    this.orderStatus,
    this.orderedAt,
    this.orderedBy,
    this.orderedBySpecialization,
    this.labOrder,
  });
}
