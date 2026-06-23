class Session {
  String? id;
  String? patientId;
  String? status;
  String? title;
  int? messageCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic lastMessagePreview;

  Session({
    this.id,
    this.patientId,
    this.status,
    this.title,
    this.messageCount,
    this.createdAt,
    this.updatedAt,
    this.lastMessagePreview,
  });
}
