import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/mapper/medical_history/get_list_medical_history/get_list_medical_history_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_history/get_medical_history/get_medical_history_response_mapper.dart';
import 'package:sijil_patient_portal/api/web_service.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/medical_history/medical_history_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_list_medical_history_response/get_list_medical_history_response.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/get_medical_history_response.dart';

@Injectable(as: MedicalHistoryDataSources)
class MedicalHistoryDataSourcesImpl extends MedicalHistoryDataSources {
  WebService webService;
  MedicalHistoryDataSourcesImpl({required this.webService});
  @override
  Future<GetListMedicalHistoryResponse> getListMedicalHistory() async {
    final getListMedicalHistoryResponseDto = await webService
        .getListMedicalHistory();
    //todo:GetListMedicalHistoryResponseDto => GetListMedicalHistoryResponse
    return getListMedicalHistoryResponseDto
        .convertToGetListMedicalHistoryResponse();
  }

  @override
  Future<GetMedicalHistoryResponse> getMedicalHistory({
    required String encounterId,
  }) async {
    final getMedicalHistoryResponseDto = await webService.getMedicalHistory(
      encounterId,
    );
    //todo:GetMedicalHistoryResponseDto => GetMedicalHistoryResponse
    return getMedicalHistoryResponseDto.convertToGetMedicalHistoryResponse();
  }
}
