import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/list_patient_active_imaging_order_response/list_patient_active_imaging_order_response.dart';
import 'package:sijil_patient_portal/domain/repositories/permission_token/permission_token_repository.dart';

@injectable
class ListPatientActiveImagingOrderUseCase {
  PermissionTokenRepository permissionTokenRepository;
  ListPatientActiveImagingOrderUseCase({
    required this.permissionTokenRepository,
  });
  Future<ListPatientActiveImagingOrderResponse> invoke() {
    return permissionTokenRepository.getListPatientActiveImagingOrder();
  }
}
