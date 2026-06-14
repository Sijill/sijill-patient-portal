import 'package:sijil_patient_portal/api/mapper/permission_token/order_patient_imaging_mapper.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/list_patient_active_imaging_order_response/list_patient_active_imaging_order_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/list_patient_active_imaging_order_response/list_patient_active_imaging_order_response.dart';

extension ListPatientActiveImagingOrderResponseMapper
    on ListPatientActiveImagingOrderResponseDto {
  ListPatientActiveImagingOrderResponse
  convertToListPatientActiveImagingOrderResponse() {
    return ListPatientActiveImagingOrderResponse(
      orders: orders?.map((e) => e.convertToOrderPatientImaging()).toList(),
    );
  }
}
