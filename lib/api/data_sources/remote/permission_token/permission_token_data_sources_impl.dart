import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/mapper/permission_token/generate_permission_token_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/permission_token/generate_permission_token_response_mapper.dart';
import 'package:sijil_patient_portal/api/web_service.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/permission_token/permission_token_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/request/generate_permission_token/generate_permission_token_request.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_permission_token/generate_permission_token_response.dart';

@Injectable(as: PermissionTokenDataSources)
class PermissionTokenDataSourcesImpl implements PermissionTokenDataSources {
  WebService webService;
  PermissionTokenDataSourcesImpl({required this.webService});

  @override
  Future<GeneratePermissionTokenResponse> generatePermissionToken({
    required GeneratePermissionTokenRequest generatePermissionTokenRequest,
  }) async {
    //todo: GeneratePermissionTokenRequest => GeneratePermissionTokenRequestDto
    final generatePermissionTokenResponseDto = await webService
        .generatePermissionToken(
          generatePermissionTokenRequest
              .convertToGeneratePermissionTokenRequestDto(),
        );
    //todo: GeneratePermissionTokenResponseDto => GeneratePermissionTokenResponse
    return generatePermissionTokenResponseDto
        .concertGeneratePermissionTokenResponse();
  }
}
