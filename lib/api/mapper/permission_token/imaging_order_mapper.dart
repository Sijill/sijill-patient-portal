import 'package:sijil_patient_portal/api/model/permission_token/response/list_patient_active_imaging_order_response/imaging_order_dto.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/list_patient_active_imaging_order_response/imaging_order.dart';

extension ImagingOrderMapper on ImagingOrderDto {
  ImagingOrder convertToImagingOrder() {
    return ImagingOrder(
      bodyPart: bodyPart,
      clinicalIndication: clinicalIndication,
      contrastUsed: contrastUsed,
      imagingType: imagingType,
      priority: priority,
    );
  }
}
