import 'package:sijil_patient_portal/api/model/permission_token/response/get_permission_token/token.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/get_permission_token/get_token_list.dart';

extension GetTokenListMapper on Token {
  GetTokenList convertToGetTokenList() {
    return GetTokenList(
      accessType: accessType,
      createdAt: createdAt,
      entityType: entityType,
      expiresAt: expiresAt,
      tokenId: tokenId,
      wasUsed: wasUsed,
    );
  }
}
