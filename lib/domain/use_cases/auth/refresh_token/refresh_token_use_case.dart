import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/refresh_token/refresh_token_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/refresh_token/refresh_token_response.dart';
import 'package:sijil_patient_portal/domain/repositories/auth/auth_repository.dart';

@injectable
class RefreshTokenUseCase {
  AuthRepository authRepository;
  RefreshTokenUseCase({required this.authRepository});
  Future<RefreshTokenResponse> invoke(RefreshTokenRequest refreshTokenRequest) {
    return authRepository.refreshToken(refreshTokenRequest);
  }
}
