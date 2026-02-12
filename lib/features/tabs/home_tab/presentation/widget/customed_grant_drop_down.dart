import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/cubit/home_tab_cubt.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/cubit/home_tab_state.dart';

class CustomedGrantDropDown extends StatefulWidget {
  final String title;
  final String imageName;
  final String selectedDropDown;
  final List<String> bottoShowSelectItem;
  final double? imageHeight;
  final double? imageWidth;
  final double? bottomSheetHeight;
  final double? bottomSheetWidth;
  final Color? containerColor;

  const CustomedGrantDropDown({
    super.key,
    required this.selectedDropDown,
    required this.title,
    required this.imageName,
    required this.bottoShowSelectItem,
    this.imageHeight,
    this.imageWidth,
    this.bottomSheetHeight,
    this.bottomSheetWidth,
    this.containerColor,
  });

  @override
  State<CustomedGrantDropDown> createState() => _CustomedGrantDropDownState();
}

class _CustomedGrantDropDownState extends State<CustomedGrantDropDown> {
  final viewodel = getIt<HomeTabCubt>();
  @override
  void initState() {
    super.initState();
    viewodel.selectItem = widget.selectedDropDown;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadiusGeometry.circular(32.r),
          child: Image.asset(
            widget.imageName,
            height: widget.imageHeight ?? 45.h,
            width: widget.imageWidth ?? 45.w,
            fit: BoxFit.scaleDown,
          ),
        ),
        SizedBox(width: 8.w),
        Text(widget.title, style: AppStyle.meduimBlack14),
        SizedBox(width: 9.w),
        Container(
          width: 165.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: widget.containerColor ?? AppColors.containerMeduimBlueColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: BlocBuilder<HomeTabCubt, HomeTabState>(
            bloc: viewodel,
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(viewodel.selectItem, style: AppStyle.boldWhite16),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: AppColors.transparent,
                        context: context,
                        builder: (context) => Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          margin: EdgeInsets.only(
                            bottom: widget.bottomSheetHeight ?? 275.h,
                            left: widget.bottomSheetWidth ?? 100.w,
                          ),
                          height: 100.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: ListView.separated(
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                viewodel.changeSelectItem(
                                  widget.bottoShowSelectItem[index],
                                );
                                Navigator.of(context).pop();
                              },
                              child:
                                  viewodel.selectItem ==
                                      widget.bottoShowSelectItem[index]
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.authContainerColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            widget.bottoShowSelectItem[index],
                                            style: AppStyle.mediumDarkBlue16,
                                          ),
                                          Icon(
                                            Icons.check,
                                            color: AppColors
                                                .containerDarkBlueColor,
                                            size: 25.sp,
                                          ),
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                        vertical: 2.h,
                                      ),
                                      child: Text(
                                        widget.bottoShowSelectItem[index],
                                        style: AppStyle.mediumDarkBlue16,
                                      ),
                                    ),
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 5.h),
                            itemCount: widget.bottoShowSelectItem.length,
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: AppColors.white,
                      size: 35.sp,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
