import 'package:sijil_patient_portal/api/mapper/permission_token/imaging_order_mapper.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/list_patient_active_imaging_order_response/order_patient_imaging_dto.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/list_patient_active_imaging_order_response/order_patient_imaging.dart';

extension OrderPatientImagingMapper on OrderPatientImagingDto {
  OrderPatientImaging convertToOrderPatientImaging() {
    return OrderPatientImaging(
      imagingOrder: imagingOrder?.convertToImagingOrder(),
      orderId: orderId,
      orderStatus: orderStatus,
      orderType: orderType,
      orderedAt: orderedAt,
      orderedBy: orderedBy,
      orderedBySpecialization: orderedBySpecialization,
    );
  }
}
