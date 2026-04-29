import 'dart:typed_data';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/repositories/medical_identity/medical_identity_repository.dart';

@injectable
class GetProfileImageUseCase {
  MedicalIdentityRepository medicalIdentityRepository;
  GetProfileImageUseCase({required this.medicalIdentityRepository});
  Future<Uint8List> invoke() {
    return medicalIdentityRepository.getProfileImage();
  }
}
