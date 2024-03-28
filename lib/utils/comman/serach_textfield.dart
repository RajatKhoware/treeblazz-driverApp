import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';

class SearchTextFeild extends StatelessWidget {
  final TextEditingController controller;
  const SearchTextFeild({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * 0.9,
      height: height * 0.065,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          focusColor: Colors.black,
          fillColor: const Color.fromARGB(255, 244, 245, 247),
          hintText: "Search for products",
          hintStyle: TextStyle(
            fontSize: width * 0.038,
            fontWeight: FontWeight.w600,
            color: AppColor.greyColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width * 0.04),
            borderSide: BorderSide(color: Colors.blue, width: width * 0.004),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width * 0.04),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width * 0.04),
            borderSide: const BorderSide(color: Colors.red),
          ),
          prefixIcon: Icon(
            CupertinoIcons.search,
            size: width * 0.06,
            color: AppColor.greyColor,
          ),
        ),
      ),
    );
  }
}
