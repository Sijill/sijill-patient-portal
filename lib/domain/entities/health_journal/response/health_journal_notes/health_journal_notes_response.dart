import 'package:sijil_patient_portal/domain/entities/health_journal/response/health_journal_notes/entry.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/health_journal_notes/health_snapshot.dart';

class HealthJournalNotesResponse {
  Entry? entry;
  HealthSnapshot? healthSnapshot;

  HealthJournalNotesResponse({this.entry, this.healthSnapshot});
}
