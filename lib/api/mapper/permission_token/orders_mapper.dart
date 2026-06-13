import 'package:sijil_patient_portal/api/mapper/permission_token/lab_order_mapper.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/list_patient_active_lab_order_response/order_dto.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/list_patient_active_lab_order_response/order.dart';

extension OrdersMapper on OrderDto {
  Order convertToOrder() {
    return Order(
      orderId: orderId,
      orderStatus: orderStatus,
      orderType: orderStatus,
      orderedAt: orderedAt,
      orderedBy: orderedBy,
      orderedBySpecialization: orderedBySpecialization,
      labOrder: labOrder?.convertToLabOrder(),
    );
  }
}
