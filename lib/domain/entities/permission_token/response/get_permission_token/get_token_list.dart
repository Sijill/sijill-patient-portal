class GetTokenList {
  String? tokenId;
  String? entityType;
  String? accessType;
  DateTime? expiresAt;
  DateTime? createdAt;
  bool? wasUsed;

  GetTokenList({
    this.tokenId,
    this.entityType,
    this.accessType,
    this.expiresAt,
    this.createdAt,
    this.wasUsed,
  });
}
