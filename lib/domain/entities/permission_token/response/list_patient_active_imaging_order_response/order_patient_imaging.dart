import 'package:sijil_patient_portal/domain/entities/permission_token/response/list_patient_active_imaging_order_response/imaging_order.dart';

class OrderPatientImaging {
  String? orderId;
  String? orderType;
  String? orderStatus;
  DateTime? orderedAt;
  String? orderedBy;
  String? orderedBySpecialization;
  ImagingOrder? imagingOrder;

  OrderPatientImaging({
    this.orderId,
    this.orderType,
    this.orderStatus,
    this.orderedAt,
    this.orderedBy,
    this.orderedBySpecialization,
    this.imagingOrder,
  });
}
