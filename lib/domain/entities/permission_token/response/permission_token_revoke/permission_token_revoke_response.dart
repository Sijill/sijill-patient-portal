class PermissionTokenRevokeResponse {
  bool? success;
  String? message;
  String? tokenId;
  DateTime? revokedAt;

  PermissionTokenRevokeResponse({
    this.success,
    this.message,
    this.tokenId,
    this.revokedAt,
  });
}
