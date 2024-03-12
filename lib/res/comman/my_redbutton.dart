import 'package:flutter/material.dart';
import 'package:tb_driver/res/comman/app_colors.dart';
import 'package:tb_driver/res/comman/my_text.dart';

class CustomButton extends StatelessWidget {
  final double? vspacing;
  final double? hspacing;
  final String text;
  final double? fontSize;
  final Color? buttonColor;
  final Color? fontColor;
  final VoidCallback onTap;
  final double? borderRadiuss;
  final FontWeight? fontWeight;
  const CustomButton(
      {super.key,
      this.vspacing,
      this.hspacing,
      required this.text,
      this.fontSize,
      this.buttonColor,
      this.fontColor,
      required this.onTap,
      this.borderRadiuss,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: vspacing ?? height * 0.013,
          horizontal: hspacing ?? width * 0.02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiuss ?? 6),
          color: buttonColor ?? AppColor.redColor,
        ),
        child: Center(
          child: MyTextSansPro(
            text: text,
            fontSize: fontSize ?? width * 0.06,
            fontWeight: fontWeight ?? FontWeight.w500,
            color: fontColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
