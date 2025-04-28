import 'package:flutter/material.dart';
import 'package:flutter_projects/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.textDecoration,
    this.decorationColor,
    this.onTextTap,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final VoidCallback? onTextTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTextTap,
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        overflow: overflow,
        maxLines: maxLines,
        style: GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color ?? AppColors.greyColor,
          decoration: textDecoration ?? TextDecoration.none,
          decorationColor: decorationColor ?? AppColors.primaryTextColor,
        ),
      ),
    );
  }
}
