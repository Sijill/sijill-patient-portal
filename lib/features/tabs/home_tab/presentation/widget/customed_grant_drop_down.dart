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
  final double? bottomSheetHeight;
  final double? bottomSheetWidth;
  final Color? backgroundColor;
  final double? containerWidth;
  final double? fontSize;
  final double? heightDrobdown;
  final double? widthDropdown;
  final IconData? prefixIcon;

  const CustomedGrantDropDown({
    super.key,
    required this.selectedDropDown,
    required this.bottoShowSelectItem,
    this.bottomSheetHeight,
    this.bottomSheetWidth,
    this.backgroundColor,
    this.containerWidth,
    this.fontSize,
    this.prefixIcon,
    this.heightDrobdown,
    this.widthDropdown,
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
      width: widget.containerWidth ?? 155.w,
      height: 55.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: BlocBuilder<HomeTabCubt, HomeTabState>(
        bloc: viewodel,
        builder: (context, state) {
          return Row(
            children: [
              widget.prefixIcon != null
                  ? Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Icon(
                            widget.prefixIcon,
                            size: 24.sp,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(width: 16.w),
                      ],
                    )
                  : SizedBox(),
              Text(
                viewodel.selectItem,
                style: AppStyle.mediumBlack16.copyWith(
                  fontSize: widget.fontSize ?? 20.sp,
                ),
              ),
              Spacer(),
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
                        right: widget.bottomSheetWidth ?? 0,
                      ),
                      height: widget.heightDrobdown ?? 130.h,
                      width: widget.widthDropdown ?? 170.w,
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
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        widget.bottoShowSelectItem[index],
                                        style: AppStyle.mediumBlack16.copyWith(
                                          fontSize: widget.fontSize ?? 20.sp,
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
                                      fontSize: widget.fontSize ?? 20.sp,
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
