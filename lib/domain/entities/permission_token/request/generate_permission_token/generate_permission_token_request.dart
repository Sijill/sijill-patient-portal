class GeneratePermissionTokenRequest {
  String? entityType;
  String? accessType;
  int? expiresInMinutes;

  GeneratePermissionTokenRequest({
    this.entityType,
    this.accessType,
    this.expiresInMinutes,
  });
}
