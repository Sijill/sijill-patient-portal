import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/features/health_journal/screen/health_journal_tab.dart';
import 'package:sijil_patient_portal/features/home/screen/home_tab.dart';
import 'package:sijil_patient_portal/features/medical_history/screen/medical_history_tab.dart';
import 'package:sijil_patient_portal/features/profile/screen/profile_tab.dart';
import 'package:sijil_patient_portal/features/settings/screen/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;
  NotchBottomBarController controller = NotchBottomBarController();
  List<Widget> tabs = [
    HomeTab(),
    ProfileTab(),
    HealthJournalTab(),
    MedicalHistoryTab(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.homeBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: height * 0.05),
          child: AnimatedNotchBottomBar(
            removeMargins: true,
            topMargin: 24.h,
            circleMargin: 0,
            kIconSize: 24.h,
            kBottomRadius: 0,
            bottomBarHeight: height * 0.06,
            notchColor: AppColors.primaryColor,
            elevation: 0,
            notchBottomBarController: controller,

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
              selectIndex = index;
              setState(() {});
            },
          ),
        ),
        body: tabs[selectIndex],
      ),
    );
  }

  BottomBarItem customedBottomBarItem({
    required IconData inActiveItem,
    required IconData activeItem,
  }) {
    return BottomBarItem(
      inActiveItem: Icon(inActiveItem, color: AppColors.gray, size: 32.sp),
      activeItem: Transform.translate(
        offset: Offset(2.w, -10.h),
        child: Icon(activeItem, color: AppColors.white, size: 35.sp),
      ),
    );
  }
}
