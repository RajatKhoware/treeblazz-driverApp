import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_driver/fetaures/dynamic/auth/controllers/signin_controller.dart';

import '../../../../utils/comman/my_text.dart';
import '../../../../utils/constant/app_images.dart';

class LoginWithSocialWidget extends StatelessWidget {
  final bool? isSignUp;
  const LoginWithSocialWidget({super.key, this.isSignUp});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final signinController = Get.put(SigninController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(flex: 1, child: Divider()),
              Flexible(
                flex: 2,
                child: MyTextPoppines(
                  text:
                      "  or ${isSignUp ?? false ? "Sign Up" : "Sign In"}  with social   ",
                  fontSize: width * 0.03,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Flexible(flex: 1, child: Divider()),
            ],
          ),
          SizedBox(height: height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildIcons(
                context,
                AppImages.googleLogo,
                () => signinController.googleSignIn(),
              ),
              buildIcons(context, AppImages.facebookLogo, () {}),
              buildIcons(context, AppImages.twitterLogo, () {})
            ],
          ),
        ],
      ),
    );
  }

  Widget buildIcons(BuildContext context, String img, VoidCallback onTap) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width * 0.2,
        height: height * 0.07,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade400,
          ),
        ),
        child: Image(
          image: AssetImage(img),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
