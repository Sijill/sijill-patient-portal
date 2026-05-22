import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_list_medical_history_response/get_list_medical_history_response.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/get_medical_history_response.dart';

abstract class MedicalHistoryState {}

class MedicalHistoryInitial extends MedicalHistoryState {}

class GetListMedicalHistoryLoading extends MedicalHistoryState {}

class GetListMedicalHistorySuccess extends MedicalHistoryState {
  GetListMedicalHistoryResponse getListMedicalHistoryResponse;
  GetListMedicalHistorySuccess({required this.getListMedicalHistoryResponse});
}

class GetListMedicalHistoryError extends MedicalHistoryState {
  String? message;
  GetListMedicalHistoryError({required this.message});
}

class GetMedicalHistoryLoading extends MedicalHistoryState {}

class GetMedicalHistorySuccess extends MedicalHistoryState {
  GetMedicalHistoryResponse getMedicalHistoryResponse;
  GetMedicalHistorySuccess({required this.getMedicalHistoryResponse});
}

class GetMedicalHistoryError extends MedicalHistoryState {
  String? message;
  GetMedicalHistoryError({required this.message});
}
