class GenerateLabPermissionTokenResponse {
  String? tokenId;
  String? code;
  String? entityType;
  String? accessType;
  DateTime? expiresAt;
  String? medicalOrderId;

  GenerateLabPermissionTokenResponse({
    this.tokenId,
    this.code,
    this.entityType,
    this.accessType,
    this.expiresAt,
    this.medicalOrderId,
  });
}
