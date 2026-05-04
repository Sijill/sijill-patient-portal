import 'package:sijil_patient_portal/api/model/medical_identity/response/get_medical_identity/basic_info_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/basic_info.dart';

extension BasicInfoMapper on BasicInfoDto {
  BasicInfo convertToBasicInfo() {
    return BasicInfo(
      age: age,
      bloodType: bloodType,
      bmi: bmi,
      gender: gender,
      heightCm: heightCm,
      weightKg: weightKg,
    );
  }
}
