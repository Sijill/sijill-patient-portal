abstract class HealthJournalState {}

class HealthJournalInitial extends HealthJournalState {}

class GetHealthJournalDiagonsesLoading extends HealthJournalState {}

class GetHealthJournalDiagonsesError extends HealthJournalState {
  String? message;
  GetHealthJournalDiagonsesError({required this.message});
}

class GetHealthJournalDiagonsesSuccess extends HealthJournalState {}
