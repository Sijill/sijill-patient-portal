import 'package:sijil_patient_portal/domain/entities/permission_token/response/get_permission_token/get_token_list.dart';

class GetPermissionTokenResponse {
  List<GetTokenList>? getTokenList;

  GetPermissionTokenResponse({this.getTokenList});
}
