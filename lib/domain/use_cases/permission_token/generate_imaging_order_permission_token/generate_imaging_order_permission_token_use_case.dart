import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_imaging_permission_token_response/generate_imaging_permission_token_response.dart';
import 'package:sijil_patient_portal/domain/repositories/permission_token/permission_token_repository.dart';

@injectable
class GenerateImagingOrderPermissionTokenUseCase {
  PermissionTokenRepository permissionTokenRepository;
  GenerateImagingOrderPermissionTokenUseCase({
    required this.permissionTokenRepository,
  });
  Future<GenerateImagingPermissionTokenResponse> invoke({
    required String orderId,
  }) {
    return permissionTokenRepository.generateImagingOrderPermissionToken(
      orderId: orderId,
    );
  }
}
