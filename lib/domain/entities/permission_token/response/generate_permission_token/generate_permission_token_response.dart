class GeneratePermissionTokenResponse {
  String? tokenId;
  String? code;
  String? entityType;
  String? accessType;
  DateTime? expiresAt;

  GeneratePermissionTokenResponse({
    this.tokenId,
    this.code,
    this.entityType,
    this.accessType,
    this.expiresAt,
  });
}
