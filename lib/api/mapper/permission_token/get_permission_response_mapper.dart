import 'package:sijil_patient_portal/api/mapper/permission_token/get_token_list_mapper.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/get_permission_token/get_permission_token_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/get_permission_token/get_permission_token_response.dart';

extension GetPermissionResponseMapper on GetPermissionTokenResponseDto {
  GetPermissionTokenResponse convertToGetPermissionTokenResponse() {
    return GetPermissionTokenResponse(
      getTokenList: tokens
          ?.map((getToken) => getToken.convertToGetTokenList())
          .toList(),
    );
  }
}
