import 'package:flutter/material.dart';
import 'package:tb_driver/res/comman/my_text.dart';

class MyTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String headingText;
  final String hintText;
  final Color? fillColor;
  final int? maxLines;

  final FocusNode? focusNode;
  final Function(String)? onSubmit;
  final String? Function(String?)? validator;
  const MyTextFeild(
      {super.key,
      required this.controller,
      required this.headingText,
      required this.hintText,
      this.fillColor,
      this.validator,
      this.focusNode,
      this.onSubmit,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    OutlineInputBorder lineBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: width * 0.002,
        color: Colors.black.withOpacity(0.3),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.02),
        MyTextPoppines(
          text: headingText,
          fontSize: width * 0.040,
          color: Colors.black.withOpacity(0.4),
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: height * 0.01),
        TextFormField(
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          controller: controller,
          cursorColor: Colors.black,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.022,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: width * 0.038,
              fontWeight: FontWeight.w600,
            ),
            fillColor: fillColor ?? Colors.transparent,
            filled: true,
            border: lineBorder,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width * 0.02),
              borderSide:
                  BorderSide(color: Colors.blue.shade200, width: width * 0.004),
            ),
            enabledBorder: lineBorder,
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusColor: Colors.black,
          ),
          validator: validator,
          focusNode: focusNode,
          onFieldSubmitted: onSubmit,
        ),
      ],
    );
  }
}
