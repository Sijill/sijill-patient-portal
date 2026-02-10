import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/model/onboarding_model.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/features/onboarding/presentation/cubit/onboarding_state.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingIntialState());

  List<OnboardingModel> onboardingList = [
    OnboardingModel(
      title:
          "Sijill is your official digital health record managed by the ministry of health",
      body: "Clear Vision, For Better Healthcare",
      image: AppAssets.onboarding1,
    ),
    OnboardingModel(
      title: "All your medical history in one place",
      body: "Visits, test results, prescriptions, and diagnoses all connected",
      image: AppAssets.onboarding2,
    ),
    OnboardingModel(
      title: "You decide who sees your records and for how long",
      body: "",
      image: AppAssets.onboarding3,
    ),
  ];
}
