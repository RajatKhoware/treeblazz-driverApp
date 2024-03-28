import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextPoppines extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  const MyTextPoppines({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.height,
    this.maxLines,
    this.textAlign,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: fontSize ?? width / 28,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontStyle: FontStyle.normal,
          color: color ?? Colors.black,
          height: height ?? (heights > 650 ? heights / 600 : heights / 600),
          decoration: textDecoration ?? TextDecoration.none),
      textAlign: textAlign,
      maxLines: maxLines ?? 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class MyTextSansPro extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  const MyTextSansPro({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.height,
    this.maxLines,
    this.textAlign,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize ?? width / 28,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontStyle: FontStyle.normal,
          color: color ?? Colors.black,
          height: height ?? (heights > 650 ? heights / 600 : heights / 600),
          decoration: textDecoration ?? TextDecoration.none,
          fontFamily: "SansPro"),
      textAlign: textAlign,
      maxLines: maxLines ?? 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class MyTextHelvetica extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  const MyTextHelvetica({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.height,
    this.maxLines,
    this.textAlign,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize ?? width / 28,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontStyle: FontStyle.normal,
          color: color ?? Colors.black,
          height: height ?? (heights > 650 ? heights / 600 : heights / 600),
          decoration: textDecoration ?? TextDecoration.none,
          fontFamily: "Helvetica"),
      textAlign: textAlign,
      maxLines: maxLines ?? 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
