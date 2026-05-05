class Note {
  String? noteId;
  DateTime? noteDate;
  String? patientOutcome;
  String? patientOutcomeDetails;
  String? mood;
  int? painLevel;
  int? energyLevel;
  DateTime? createdAt;

  Note({
    this.noteId,
    this.noteDate,
    this.patientOutcome,
    this.patientOutcomeDetails,
    this.mood,
    this.painLevel,
    this.energyLevel,
    this.createdAt,
  });
}
