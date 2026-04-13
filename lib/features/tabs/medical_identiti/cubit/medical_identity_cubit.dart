import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_state.dart';

@injectable
class MedicalIdentityCubit extends Cubit<MedicalIdentityState> {
  MedicalIdentityCubit() : super(MedicalIdentityInitial());

  bool selectItem = false;

  void toggleSelectItem() {
    selectItem = !selectItem;
    emit(MedicalIdentityChangeSelectItem());
  }
}
