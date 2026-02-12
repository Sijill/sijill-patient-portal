import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPassword;
  final String? hint;
  final String? label;
  final bool? enabled;
  final TextStyle? textStyle;
  final int? maxLines, minLines, maxLength;
  final String? obscuringCharacter, value;
  final String? Function(String?)? onValidate;
  final void Function(String?)? onChanged, onFieldSubmitted, onSaved;
  final void Function()? onEditingComplete, onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget, prefixIcon;
  final IconData? icon;
  final TextInputAction? action;
  final FocusNode? focusNode;
  final Color? hintColor;
  final TextDirection? textDirection;
  final EdgeInsets? edgeInsets;
  final bool readOnly;
  final InputDecoration? decoration;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final Color? iconVisabilyColor;

  const CustomTextField({
    super.key,
    this.controller,
    this.isPassword,
    this.hint,
    this.textStyle,
    this.label,
    this.enabled,
    this.obscuringCharacter,
    this.value,
    this.onValidate,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.decoration,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.suffixWidget,
    this.icon,
    this.prefixIcon,
    this.action,
    this.focusNode,
    this.textDirection,
    this.edgeInsets = const EdgeInsets.only(
      top: 12,
      left: 5,
      right: 5,
      bottom: 12,
    ),
    this.hintColor = Colors.white,
    this.fillColor,
    this.hintStyle,
    this.iconVisabilyColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        readOnly: widget.readOnly,
        textDirection: widget.textDirection,
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        initialValue: widget.value,
        validator: widget.onValidate,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        onTap: widget.onTap,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        obscureText: widget.isPassword ?? false ? obscureText : false,
        obscuringCharacter: '*',
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        enabled: widget.enabled,
        style: widget.textStyle ?? AppStyle.boldBlack16,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: widget.action ?? TextInputAction.done,
        focusNode: widget.focusNode,
        cursorColor: theme.primaryColor,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: AppStyle.meduimBlack18,
          prefixIconConstraints: const BoxConstraints(minWidth: 56),
          suffixIcon: widget.isPassword ?? false
              ? InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: widget.iconVisabilyColor ?? Colors.grey,
                  ),
                )
              : widget.suffixWidget,
          prefixIcon: widget.prefixIcon,

          hintText: widget.hint,
          hintStyle: widget.hintStyle ?? AppStyle.meduimBlack18,
          counterText: "",
          fillColor: widget.fillColor ?? AppColors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.blueLight, width: 1),
          ),
          // suffix: isPass widget.suffixWidget,
          contentPadding: widget.edgeInsets,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.blueLight, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: AppColors.blueLight, width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: AppColors.blueLight, width: 1.w),
          ),
          errorStyle: AppStyle.meduimRed14,
          errorMaxLines: 6,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: AppColors.red, width: 1.w),
          ),
        ),
      ),
    );
  }
}
