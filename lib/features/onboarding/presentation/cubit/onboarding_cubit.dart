import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/model/onboarding/onboarding_model.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/features/onboarding/presentation/cubit/onboarding_state.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingIntialState());

  List<OnboardingModel> onboardingList = [
    OnboardingModel(
      title:
          "Your Official Electronic\nHealth Record, Managed By The Ministry Of Health.",
      body: "",
      image: AppAssets.onboarding1,
    ),
    OnboardingModel(
      title: "All Your Medical History In One Place.",
      body:
          "Visits, Tests, Results, Prescriptions And Diagnosis All Connected.",
      image: AppAssets.onboarding2,
    ),
    OnboardingModel(
      title: "You Decide Who Sees Your Records, When and for how long",
      body: "",
      image: AppAssets.onboarding3,
    ),
  ];
}
