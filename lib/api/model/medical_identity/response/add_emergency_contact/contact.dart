import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  @JsonKey(name: 'contact_id')
  String? contactId;
  @JsonKey(name: 'contact_name')
  String? contactName;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? relationship;
  @JsonKey(name: 'is_primary')
  bool? isPrimary;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  Contact({
    this.contactId,
    this.contactName,
    this.phoneNumber,
    this.relationship,
    this.isPrimary,
    this.createdAt,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return _$ContactFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
