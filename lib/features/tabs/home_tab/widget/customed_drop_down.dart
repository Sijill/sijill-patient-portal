import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_cubt.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_state.dart';

class CustomedDropDown extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? onValidate;

  final List<String> bottoShowSelectItem;
  final double? bottomSheetHeight;
  final double? bottomSheetLeft;
  final double? bottomSheetRight;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final double? heightDrobdown;
  final double? widthDropdown;
  final double? paddingVerticalItem;
  final double? paddingHorizontalItem;
  final IconData? prefixIcon;
  final Function(int index)? onChanged;

  const CustomedDropDown({
    super.key,
    required this.bottoShowSelectItem,
    this.bottomSheetHeight,
    this.backgroundColor,
    this.fontSize,
    this.prefixIcon,
    this.heightDrobdown,
    this.widthDropdown,
    required this.controller,
    this.onValidate,
    required this.hint,
    this.paddingVerticalItem,
    this.bottomSheetLeft,
    this.bottomSheetRight,
    this.textColor,
    this.paddingHorizontalItem,
    this.onChanged,
  });

  @override
  State<CustomedDropDown> createState() => _CustomedDropDownState();
}

class _CustomedDropDownState extends State<CustomedDropDown> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeTabCubt>().setInitialValue(
        key: widget.hint,
        value: widget.hint,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubt, HomeTabState>(
      builder: (context, state) {
        final viewodel = context.read<HomeTabCubt>();
        return CustomTextField(
          onTap: () {
            showModalBottomSheet(
              backgroundColor: AppColors.transparent,
              isScrollControlled: true,
              context: context,
              builder: (context) => Container(
                padding: EdgeInsets.symmetric(
                  vertical: widget.paddingVerticalItem ?? 8.h,
                  horizontal: widget.paddingHorizontalItem ?? 5.w,
                ),
                margin: EdgeInsets.only(
                  bottom: widget.bottomSheetHeight ?? 50.h,
                  left: widget.bottomSheetLeft ?? 105.w,
                  right: widget.bottomSheetRight ?? 0,
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
                      final value = widget.bottoShowSelectItem[index];
                      viewodel.changeSelectItem(key: widget.hint, value: value);
                      widget.controller.text = value;
                      if (widget.onChanged != null) {
                        widget.onChanged!(index);
                      }
                      Navigator.of(context).pop();
                    },
                    child:
                        viewodel.selectedItems[widget.hint] ==
                            widget.bottoShowSelectItem[index]
                        ? Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            color: AppColors.primaryColor,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              margin: EdgeInsets.symmetric(horizontal: 10.w),
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
                            ),
                          )
                        : Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            color: AppColors.lightGray,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 10.h,
                              ),
                              child: AutoSizeText(
                                widget.bottoShowSelectItem[index],
                                style: AppStyle.mediumBlack16.copyWith(
                                  fontSize: widget.fontSize ?? 20.sp,
                                ),
                              ),
                            ),
                          ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 0),
                  itemCount: widget.bottoShowSelectItem.length,
                ),
              ),
            );
          },
          hint: widget.hint,
          hintStyle: AppStyle.mediumBlack16.copyWith(
            color: widget.textColor ?? AppColors.black,
          ),
          fillColor: widget.backgroundColor,
          controller: widget.controller,
          readOnly: true,
          onValidate: widget.onValidate,
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, size: 24.sp, color: AppColors.black)
              : null,
          suffixWidget: Icon(
            Icons.arrow_drop_down_outlined,
            size: 30.sp,
            color: AppColors.black,
          ),
        );
      },
    );
  }
}
