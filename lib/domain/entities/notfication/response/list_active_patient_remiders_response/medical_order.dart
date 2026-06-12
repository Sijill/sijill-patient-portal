class MedicalOrder {
  String? medicalOrderId;
  String? orderType;
  String? orderName;
  String? priority;
  String? status;
  DateTime? orderedAt;
  String? orderedBy;
  String? specimenType;
  dynamic bodyPart;

  MedicalOrder({
    this.medicalOrderId,
    this.orderType,
    this.orderName,
    this.priority,
    this.status,
    this.orderedAt,
    this.orderedBy,
    this.specimenType,
    this.bodyPart,
  });
}
