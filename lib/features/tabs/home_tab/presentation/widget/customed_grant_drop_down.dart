import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/cubit/home_tab_cubt.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/cubit/home_tab_state.dart';

class CustomedGrantDropDown extends StatefulWidget {
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
    return Container(
      width: 155.w,
      height: 55.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: widget.containerColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: BlocBuilder<HomeTabCubt, HomeTabState>(
        bloc: viewodel,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                viewodel.selectItem,
                style: AppStyle.mediumBlack16.copyWith(fontSize: 20.sp),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: AppColors.transparent,
                    context: context,
                    builder: (context) => Container(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      margin: EdgeInsets.only(
                        bottom: widget.bottomSheetHeight ?? 50.h,
                        left: widget.bottomSheetWidth ?? 105.w,
                      ),
                      height: 130.h,
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
                                      AutoSizeText(
                                        widget.bottoShowSelectItem[index],
                                        style: AppStyle.mediumBlack16.copyWith(
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      Icon(
                                        Icons.check,
                                        color: AppColors.black,
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
                                  child: AutoSizeText(
                                    widget.bottoShowSelectItem[index],
                                    style: AppStyle.mediumBlack16.copyWith(
                                      fontSize: 20.sp,
                                    ),
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
                  color: AppColors.black,
                  size: 35.sp,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
