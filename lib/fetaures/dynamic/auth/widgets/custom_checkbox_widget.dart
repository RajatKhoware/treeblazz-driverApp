import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tb_driver/fetaures/dynamic/auth/controllers/signup_controller.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final signupController = SignupController.instance;

    return GestureDetector(
      onTap: () => signupController.onTNCTapped(),
      child: Obx(
        () => Container(
          width: width * 0.045,
          height: height * 0.025,
          decoration: BoxDecoration(
            border: Border.all(
              color: signupController.isTNCAccepted
                  ? Colors.transparent
                  : AppColor.black.withOpacity(0.6), // Border color
              width: 2,
            ),
            color: signupController.isTNCAccepted
                ? Colors.green
                : Colors.transparent, // Fill color when checked
          ),
          child: signupController.isTNCAccepted
              ? Icon(
                  CupertinoIcons.checkmark_alt,
                  size: width * 0.045,
                  color: AppColor.white, // Check icon color
                )
              : null,
        ),
      ),
    );
  }
}
