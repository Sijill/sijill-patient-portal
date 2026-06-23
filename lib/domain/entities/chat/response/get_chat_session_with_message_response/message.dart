class Message {
  String? id;
  String? sessionId;
  String? role;
  String? content;
  dynamic metadata;
  DateTime? createdAt;

  Message({
    this.id,
    this.sessionId,
    this.role,
    this.content,
    this.metadata,
    this.createdAt,
  });
}
