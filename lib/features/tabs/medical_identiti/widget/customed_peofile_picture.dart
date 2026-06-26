import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/core/utils/function_image_picker.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/upload_profile_image/upload_profile_image_request.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_state.dart';

class CustomedPeofilePicture extends StatefulWidget {
  const CustomedPeofilePicture({super.key});

  @override
  State<CustomedPeofilePicture> createState() => _CustomedPeofilePictureState();
}

class _CustomedPeofilePictureState extends State<CustomedPeofilePicture> {
  @override
  void initState() {
    context.read<MedicalIdentityCubit>().getProfileImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalIdentityCubit, MedicalIdentityState>(
      listener: (context, state) {
        if (state is UploadProfileImageSuccess) {
          DialogUtils.showDialogMessage(
            message: state.uploadProfileImageResponse.message,
            backgroundColor: AppColors.green,
          );
          context.read<MedicalIdentityCubit>().getProfileImage();
        } else if (state is UploadProfileImageError) {
          DialogUtils.showDialogMessage(message: state.message);
        }
      },

      builder: (context, state) {
        final cubit = context.watch<MedicalIdentityCubit>();

        return InkWell(
          onTap: () async {
            final image = await FunctionImagePicker.galluryicker();

            if (image != null) {
              cubit.changeSelectedImage(image);

              cubit.uploadProfileImage(
                UploadProfileImageRequest(profilePicture: image.path),
              );
            }
          },

          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: cubit.selectedImage != null
                ? Image.file(
                    cubit.selectedImage!,
                    height: 100.h,
                    width: 100.w,
                    fit: BoxFit.cover,
                  )
                : state is GetProfileImageLoading
                ? const Center(child: CircularProgressIndicator())
                : state is GetProfileImageSuccess && state.imageBytes != null
                ? Image.memory(
                    state.imageBytes!,
                    height: 100.h,
                    width: 100.w,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    AppAssets.medicalIdentity,
                    height: 100.h,
                    width: 100.w,
                    fit: BoxFit.fill,
                  ),
          ),
        );
      },
    );
  }
}
