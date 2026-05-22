import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';
import 'package:sijil_patient_portal/domain/use_cases/medical_history/get_list_medical_history_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/medical_history/get_medical_history_use_case.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/cubit/medical_history_state.dart';

@injectable
class MedicalHistoryCubit extends Cubit<MedicalHistoryState> {
  GetMedicalHistoryUseCase getMedicalHistoryUseCase;
  GetListMedicalHistoryUseCase getListMedicalHistoryUseCase;
  MedicalHistoryCubit({
    required this.getListMedicalHistoryUseCase,
    required this.getMedicalHistoryUseCase,
  }) : super(MedicalHistoryInitial());

  void getListMedicalHistory() async {
    emit(GetListMedicalHistoryLoading());
    try {
      final getListMedicalHistoryResponse = await getListMedicalHistoryUseCase
          .invoke();

      emit(
        GetListMedicalHistorySuccess(
          getListMedicalHistoryResponse: getListMedicalHistoryResponse,
        ),
      );
    } on AppException catch (e) {
      emit(GetListMedicalHistoryError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetListMedicalHistoryError(message: message));
    } catch (e) {
      emit(GetListMedicalHistoryError(message: e.toString()));
    }
  }

  void getMedicalHistory({required String encounterId}) async {
    emit(GetMedicalHistoryLoading());
    try {
      final getMedicalHistoryResponse = await getMedicalHistoryUseCase.invoke(
        encounterId: encounterId,
      );

      emit(
        GetMedicalHistorySuccess(
          getMedicalHistoryResponse: getMedicalHistoryResponse,
        ),
      );
    } on AppException catch (e) {
      emit(GetMedicalHistoryError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetMedicalHistoryError(message: message));
    } catch (e) {
      emit(GetMedicalHistoryError(message: e.toString()));
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return "Not specified";
    return DateFormat('MMMM d, yyyy').format(date);
  }
}
