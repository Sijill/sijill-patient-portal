class GenerateImagingPermissionTokenResponse {
  String? tokenId;
  String? code;
  String? entityType;
  String? accessType;
  DateTime? expiresAt;
  String? medicalOrderId;

  GenerateImagingPermissionTokenResponse({
    this.tokenId,
    this.code,
    this.entityType,
    this.accessType,
    this.expiresAt,
    this.medicalOrderId,
  });
}
