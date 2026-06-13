import 'package:sijil_patient_portal/api/mapper/permission_token/orders_mapper.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/list_patient_active_lab_order_response/list_patient_active_lab_order_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/list_patient_active_lab_order_response/list_patient_active_lab_order_response.dart';

extension ListPatientActiveLabOrderResponseMapper
    on ListPatientActiveLabOrderResponseDto {
  ListPatientActiveLabOrderResponse
  convertToListPatientActiveLabOrderResponse() {
    return ListPatientActiveLabOrderResponse(
      orders: orders?.map((e) => e.convertToOrder()).toList(),
    );
  }
}
