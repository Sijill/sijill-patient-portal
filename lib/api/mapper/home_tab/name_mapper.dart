import 'package:sijil_patient_portal/api/model/home_tab/response/patient_name/name_dto.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/patient_name/name.dart';

extension NameMapper on NameDto {
  Name convertToName() {
    return Name(
      firstName: firstName,
      middleName: middleName,
      surname: surname,
      fullName: fullName,
    );
  }
}
