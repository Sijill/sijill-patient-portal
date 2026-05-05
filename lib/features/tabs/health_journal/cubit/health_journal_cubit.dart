import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_diagonses/get_health_journal_diagonses_response.dart';
import 'package:sijil_patient_portal/domain/use_cases/health_journal/get_health_journal_diagonse_use_case.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/cubit/health_journal_state.dart';

@injectable
class HealthJournalCubit extends Cubit<HealthJournalState> {
  GetHealthJournalDiagonseUseCase healthJournalDiagonseUseCase;
  HealthJournalCubit({required this.healthJournalDiagonseUseCase})
    : super(HealthJournalInitial());

  GetHealthJournalDiagonsesResponse? data;
  void getHealthJournalDiagonses() async {
    emit(GetHealthJournalDiagonsesLoading());
    try {
      final getHealthJournalDiagonsesResponse =
          await healthJournalDiagonseUseCase.invoke();
      data = getHealthJournalDiagonsesResponse;
      emit(GetHealthJournalDiagonsesSuccess());
    } on AppException catch (e) {
      emit(GetHealthJournalDiagonsesError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetHealthJournalDiagonsesError(message: message));
    } catch (e) {
      emit(GetHealthJournalDiagonsesError(message: e.toString()));
    }
  }
}
