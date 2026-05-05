import 'package:sijil_patient_portal/api/model/health_journal/response/get_health_journal_notes/last_entry_dto.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_notes/last_entry.dart';

extension LastEntreyMapper on LastEntryDto {
  LastEntry convertToLastEntry() {
    return LastEntry(
      createdAt: createdAt,
      energyLevel: energyLevel,
      mood: mood,
      painLevel: painLevel,
      patientOutcome: patientOutcome,
    );
  }
}
