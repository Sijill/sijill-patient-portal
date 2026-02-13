import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    var width = MediaQuery.sizeOf(context).width;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    bool isMobile = shortestSide < 600;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.homeBg),
          fit: BoxFit.fill,
        ),
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.transparent,
            bottomNavigationBar: isMobile
                ? SafeArea(
                    child: AnimatedNotchBottomBar(
                      removeMargins: true,
                      topMargin: 24.h,
                      circleMargin: 0,
                      kIconSize: 24.h,
                      kBottomRadius: 0,
                      bottomBarHeight: 45.h,
                      notchColor: AppColors.primaryColor,
                      elevation: 0,
                      notchBottomBarController: controller,
                      bottomBarWidth: width,
                      bottomBarItems: [
                        customedBottomBarItem(
                          inActiveItem: Icons.home,
                          activeItem: Icons.home,
                        ),
                        customedBottomBarItem(
                          inActiveItem: Icons.person,
                          activeItem: Icons.person,
                        ),
                        customedBottomBarItem(
                          inActiveItem: Icons.favorite,
                          activeItem: Icons.favorite,
                        ),
                        customedBottomBarItem(
                          inActiveItem: Icons.folder,
                          activeItem: Icons.folder,
                        ),
                        customedBottomBarItem(
                          inActiveItem: Icons.settings,
                          activeItem: Icons.settings,
                        ),
                      ],
                      onTap: (int index) {
                        viewModel.changeTap(index);
                      },
                    ),
                  )
                : SafeArea(
                    child: BottomNavigationBar(
                      backgroundColor: AppColors.white,
                      type: BottomNavigationBarType.fixed,
                      onTap: (index) {
                        viewModel.changeTap(index);
                      },
                      items: [
                        customedBottomNavigationBarItem(
                          icon: Icons.home,
                          indx: 0,
                        ),
                        customedBottomNavigationBarItem(
                          icon: Icons.person,
                          indx: 1,
                        ),
                        customedBottomNavigationBarItem(
                          icon: Icons.favorite,
                          indx: 2,
                        ),
                        customedBottomNavigationBarItem(
                          icon: Icons.folder,
                          indx: 3,
                        ),
                        customedBottomNavigationBarItem(
                          icon: Icons.settings,
                          indx: 4,
                        ),
                      ],
                    ),
                  ),

            body: viewModel.tabs[viewModel.selectIndex],
          );
        },
      ),
    );
  }

  BottomNavigationBarItem customedBottomNavigationBarItem({
    required IconData icon,
    required int indx,
  }) {
    bool isSelected = viewModel.selectIndex == indx;

    return BottomNavigationBarItem(
      icon: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.white : AppColors.gray,
            size: 35.sp,
          ),

          if (isSelected)
            Positioned(
              top: -16.sp,
              child: Container(
                width: 50.sp,
                height: 50.sp,
                decoration: BoxDecoration(
                  color: AppColors.blueLight,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.bgColor, width: 6.sp),
                ),
                child: Icon(icon, color: AppColors.white, size: 30.sp),
              ),
            ),
        ],
      ),
      label: "",
    );
  }

  BottomBarItem customedBottomBarItem({
    required IconData inActiveItem,
    required IconData activeItem,
  }) {
    return BottomBarItem(
      inActiveItem: Icon(inActiveItem, color: AppColors.gray, size: 35.sp),
      activeItem: Transform.translate(
        offset: Offset(1.w, -9.h),
        child: Icon(activeItem, color: AppColors.white, size: 35.sp),
      ),
    );
  }
}
