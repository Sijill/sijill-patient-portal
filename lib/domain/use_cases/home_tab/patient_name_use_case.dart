import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/patient_name/patient_name_response.dart';
import 'package:sijil_patient_portal/domain/repositories/home_tab/home_tab_repository.dart';

@injectable
class PatientNameUseCase {
  HomeTabRepository homeTabRepository;
  PatientNameUseCase({required this.homeTabRepository});
  Future<PatientNameResponse> invoke() {
    return homeTabRepository.getPatientName();
  }
}
