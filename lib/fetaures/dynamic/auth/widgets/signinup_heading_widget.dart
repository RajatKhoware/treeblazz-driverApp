import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_driver/fetaures/dynamic/auth/screen/signin_screen.dart';
import 'package:tb_driver/fetaures/dynamic/auth/screen/signup_screen.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/constant/app_images.dart';

import '../../../../utils/comman/my_button.dart';
import '../../../../utils/comman/my_text.dart';

class SignInUpHeading extends StatelessWidget {
  final bool isSignIn;
  const SignInUpHeading({super.key, required this.isSignIn});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.025),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppImages.appLogo,
              width: width * 0.48,
            ),
            // MyTextSansPro(
            //   text: isSignIn ? "Sign in" : "Sign up",
            //   fontSize: width * 0.08,
            //   fontWeight: FontWeight.w600,
            // ),
            CustomButton(
              onTap: () {
                isSignIn
                    ? Get.off(() => const SignUpScreen())
                    : Get.off(() => const SignInScreen());
              },
              hspacing: width * 0.05,
              text: isSignIn ? "Sign up" : "Sign in",
              fontSize: width * 0.04,
              vspacing: height * 0.016,
              fontWeight: FontWeight.w600,
              buttonColor: const Color.fromARGB(255, 241, 235, 235),
              fontColor: AppColor.redColor,
            ),
          ],
        ),
        SizedBox(height: height * 0.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: MyTextSansPro(
            text: isSignIn
                ? "First login your account"
                : "Create your free account",
            fontSize: width * 0.04,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
