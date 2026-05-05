import 'package:sijil_patient_portal/domain/entities/health_journal/response/health_journal_notes/health_journal_notes_response.dart';

abstract class HealthJournalState {}

class HealthJournalInitial extends HealthJournalState {}

class GetHealthJournalDiagonsesLoading extends HealthJournalState {}

class GetHealthJournalDiagonsesError extends HealthJournalState {
  String? message;
  GetHealthJournalDiagonsesError({required this.message});
}

class GetHealthJournalDiagonsesSuccess extends HealthJournalState {}

class HealthJournalNotesLoading extends HealthJournalState {}

class HealthJournalNotesError extends HealthJournalState {
  String? message;
  HealthJournalNotesError({required this.message});
}

class HealthJournalNotesSuccess extends HealthJournalState {
  HealthJournalNotesResponse healthJournalNotesResponse;
  HealthJournalNotesSuccess({required this.healthJournalNotesResponse});
}
