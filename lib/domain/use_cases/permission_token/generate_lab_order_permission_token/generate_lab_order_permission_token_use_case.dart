import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_lab_permission_token_response/generate_lab_permission_token_response.dart';
import 'package:sijil_patient_portal/domain/repositories/permission_token/permission_token_repository.dart';

@injectable
class GenerateLabOrderPermissionTokenUseCase {
  PermissionTokenRepository permissionTokenRepository;
  GenerateLabOrderPermissionTokenUseCase({
    required this.permissionTokenRepository,
  });
  Future<GenerateLabPermissionTokenResponse> invoke({required String orderId}) {
    return permissionTokenRepository.generateLabOrderPermissionToken(
      orderId: orderId,
    );
  }
}
