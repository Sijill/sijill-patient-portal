import 'package:sijil_patient_portal/domain/entities/health_journal/response/health_journal_notes/diagnosis.dart';

class Entry {
  String? noteId;
  String? patientId;
  String? diagnosisId;
  DateTime? noteDate;
  String? patientOutcome;
  String? patientOutcomeDetails;
  String? mood;
  int? painLevel;
  int? energyLevel;
  DateTime? createdAt;
  DateTime? updatedAt;
  Diagnosis? diagnosis;

  Entry({
    this.noteId,
    this.patientId,
    this.diagnosisId,
    this.noteDate,
    this.patientOutcome,
    this.patientOutcomeDetails,
    this.mood,
    this.painLevel,
    this.energyLevel,
    this.createdAt,
    this.updatedAt,
    this.diagnosis,
  });
}
