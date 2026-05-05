import 'package:sijil_patient_portal/api/model/health_journal/response/get_health_journal_notes_diagones_id_response_dto/note_dto.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_notes_diagones_id_response_dto/note.dart';

extension NotesMapper on NoteDto {
  Note covertToNote() {
    return Note(
      createdAt: createdAt,
      energyLevel: energyLevel,
      mood: mood,
      noteDate: noteDate,
      noteId: noteId,
      painLevel: painLevel,
      patientOutcome: patientOutcome,
      patientOutcomeDetails: patientOutcomeDetails,
    );
  }
}
