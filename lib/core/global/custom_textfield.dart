import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.controller,
    this.onTap,
    this.hintText,
    this.isReadOnly,
    this.trailingIcon,
    this.validator,
    this.suffixImage,
    this.validationText,
    this.textInputType,
    this.isObsecure,
    this.onSuffixTap,
    this.inputFormatters,
    this.prefixIcon,
    this.onChanged,
    this.borderRadius,
  });

  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function()? onSuffixTap;
  final String? hintText;
  final bool? isReadOnly;
  final Widget? trailingIcon;
  final String? suffixImage;
  final Widget? prefixIcon;
  final String? validationText;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? isObsecure;
  final double? borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: isReadOnly ?? false,
      cursorColor: AppColors.primaryTextColor,
      keyboardType: textInputType ?? TextInputType.text,
      validator:
          validator ??
          (value) {
            if (value!.isEmpty) {
              return validationText ?? 'This field is required';
            }
            return null;
          },
      onTap: onTap,
      obscureText: isObsecure ?? false,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      style: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9F9FB),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFFE5E5E5), width: 1.w),
          borderRadius: BorderRadius.circular((borderRadius ?? 30).r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFFE5E5E5), width: 1.w),
          borderRadius: BorderRadius.circular((borderRadius ?? 30).r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFFE5E5E5), width: 1.w),
          borderRadius: BorderRadius.circular((borderRadius ?? 30).r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 144, 14, 5),
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular((borderRadius ?? 30).r),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintText: hintText ?? 'Demo',
        hintStyle: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.greyColor,
        ),
        prefixIcon: prefixIcon,
        suffixIconColor: Color(0xFF94A3B8),
      ),
    );
  }
}
