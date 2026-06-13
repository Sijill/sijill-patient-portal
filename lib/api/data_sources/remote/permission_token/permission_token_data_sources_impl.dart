import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/mapper/permission_token/generate_lap_permission_token_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/permission_token/generate_permission_token_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/permission_token/generate_permission_token_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/permission_token/get_permission_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/permission_token/list_patient_active_lab_order_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/permission_token/perimission_token_revoke_response_mapper.dart';
import 'package:sijil_patient_portal/api/web_service.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/permission_token/permission_token_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/request/generate_permission_token/generate_permission_token_request.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_lab_permission_token_response/generate_lab_permission_token_response.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_permission_token/generate_permission_token_response.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/get_permission_token/get_permission_token_response.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/list_patient_active_lab_order_response/list_patient_active_lab_order_response.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/permission_token_revoke/permission_token_revoke_response.dart';

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

  @override
  Future<GetPermissionTokenResponse> getPermissionToken() async {
    final getPermissionTokenResponseDto = await webService.getPermissionToken();

    //todo: GetPermissionTokenResponseDto => GetPermissionTokenResponse
    return getPermissionTokenResponseDto.convertToGetPermissionTokenResponse();
  }

  @override
  Future<PermissionTokenRevokeResponse> permissionTokenRevoke({
    required String tokenId,
  }) async {
    //todo: PermissionTokenRevokeRequest => PermissionTokenRevokeRequestDto
    final permissionTokenRevokeResponseDto = await webService
        .permissionTokenRevoke(tokenId);
    //todo: PermissionTokenRevokeResponseDto => PermissionTokenRevokeResponse
    return permissionTokenRevokeResponseDto
        .convertToPermissionTokenRevokeResponse();
  }

  @override
  Future<ListPatientActiveLabOrderResponse>
  getListPatientActiveLabOrder() async {
    final listPatientActiveLabOrderResponseDto = await webService
        .getListPatientActiveLabOrder();

    //todo:ListPatientActiveLabOrderResponseDto => ListPatientActiveLabOrderResponse

    return listPatientActiveLabOrderResponseDto
        .convertToListPatientActiveLabOrderResponse();
  }

  @override
  Future<GenerateLabPermissionTokenResponse> generateLabOrderPermissionToken({
    required String orderId,
  }) async {
    final generateLabPermissionTokenResponseDto = await webService
        .generateLabOrderPermissionToken(orderId);

    //todo: GenerateLabPermissionTokenResponseDto => GenerateLabPermissionTokenResponse
    return generateLabPermissionTokenResponseDto
        .convertToGenerateLabPermissionTokenResponse();
  }
}
