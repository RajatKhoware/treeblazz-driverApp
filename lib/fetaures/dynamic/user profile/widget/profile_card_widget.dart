import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';

import '../../../../utils/comman/my_text.dart';

class BuildProfileCard extends StatelessWidget {
  final String heading;
  final VoidCallback onTap;
  final Color? headingColor;
  final bool? isArrow;
  const BuildProfileCard({
    super.key,
    required this.heading,
    required this.onTap,
    this.headingColor,
    this.isArrow,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin: EdgeInsets.only(bottom: height * 0.02),
        padding: EdgeInsets.symmetric(
          vertical: height * 0.025,
          horizontal: width * 0.04,
        ),
        decoration: BoxDecoration(
          color: AppColor.greyColor.withOpacity(0.02),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.greyColor.withOpacity(0.3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTextSansPro(
              text: heading,
              fontSize: width * 0.04,
              fontWeight: FontWeight.w600,
              color: headingColor ?? Colors.black,
            ),
            isArrow ?? true
                ? Icon(
                    CupertinoIcons.forward,
                    size: width * 0.06,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
