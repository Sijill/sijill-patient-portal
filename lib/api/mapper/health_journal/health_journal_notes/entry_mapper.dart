import 'package:sijil_patient_portal/api/mapper/health_journal/health_journal_notes/diagonses_mapper.dart';
import 'package:sijil_patient_portal/api/model/health_journal/response/health_journal_notes/entry_dto.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/health_journal_notes/entry.dart';

extension EntryMapper on EntryDto {
  Entry convertToEntry() {
    return Entry(
      createdAt: createdAt,
      diagnosis: diagnosis?.convertToDiagnosis(),
      diagnosisId: diagnosisId,
      energyLevel: energyLevel,
      mood: mood,
      noteDate: noteDate,
      noteId: noteId,
      painLevel: painLevel,
      patientId: patientId,
      patientOutcome: patientOutcome,
      patientOutcomeDetails: patientOutcomeDetails,
      updatedAt: updatedAt,
    );
  }
}
