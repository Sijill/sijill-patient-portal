import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/features/home/presentation/cubit/home_cubit.dart';
import 'package:sijil_patient_portal/features/home/presentation/cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotchBottomBarController controller = NotchBottomBarController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  var viewModel = getIt<HomeCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.whiteLight,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              viewModel.changeTap(index);
            },
            items: [
              customedBottomNavigationBarItem(
                iconimage: AppAssets.home,
                indx: 0,
              ),
              customedBottomNavigationBarItem(
                iconimage: AppAssets.healthJournal,
                indx: 1,
              ),
              customedBottomNavigationBarItem(
                iconimage: AppAssets.medicalHistory,
                indx: 2,
              ),
              customedBottomNavigationBarItem(
                iconimage: AppAssets.profile,
                indx: 3,
              ),
              customedBottomNavigationBarItem(
                iconimage: AppAssets.settings,
                indx: 4,
              ),
            ],
          ),

          body: viewModel.tabs[viewModel.selectIndex],
        );
      },
    );
  }

  BottomNavigationBarItem customedBottomNavigationBarItem({
    required String iconimage,
    required int indx,
  }) {
    return BottomNavigationBarItem(
      icon: viewModel.selectIndex == indx
          ? Column(
              children: [
                SvgPicture.asset(
                  iconimage,
                  height: 40.h,
                  width: 40.w,
                  fit: BoxFit.scaleDown,
                ),
                Divider(
                  color: AppColors.primaryColor,
                  thickness: 6.sp,
                  endIndent: 16.w,
                  indent: 16.w,
                ),
              ],
            )
          : SvgPicture.asset(
              iconimage,
              height: 40.h,
              width: 40.w,
              fit: BoxFit.scaleDown,
            ),
      label: "",
    );
  }
}
