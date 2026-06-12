class Notification {
  String? notificationId;
  String? notificationType;
  String? status;
  String? title;
  String? message;
  String? reminderId;
  DateTime? scheduledFor;
  dynamic sentAt;
  dynamic readAt;
  DateTime? createdAt;

  Notification({
    this.notificationId,
    this.notificationType,
    this.status,
    this.title,
    this.message,
    this.reminderId,
    this.scheduledFor,
    this.sentAt,
    this.readAt,
    this.createdAt,
  });
}
