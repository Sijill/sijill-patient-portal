class HealthSnapshot {
  String? status;
  String? model;
  String? urgencyLevel;
  dynamic summary;
  List<dynamic>? advice;
  List<dynamic>? watchouts;
  List<dynamic>? whenToContactDoctor;
  String? disclaimer;
  String? unavailableReason;

  HealthSnapshot({
    this.status,
    this.model,
    this.urgencyLevel,
    this.summary,
    this.advice,
    this.watchouts,
    this.whenToContactDoctor,
    this.disclaimer,
    this.unavailableReason,
  });
}
