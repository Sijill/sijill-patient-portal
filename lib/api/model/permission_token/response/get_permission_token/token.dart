import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  String? tokenId;
  String? entityType;
  String? accessType;
  DateTime? expiresAt;
  DateTime? createdAt;
  bool? wasUsed;

  Token({
    this.tokenId,
    this.entityType,
    this.accessType,
    this.expiresAt,
    this.createdAt,
    this.wasUsed,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
