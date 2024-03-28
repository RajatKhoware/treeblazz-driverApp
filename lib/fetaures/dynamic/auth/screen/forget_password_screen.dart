import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_driver/fetaures/dynamic/auth/screen/reset_password_screen.dart';
import 'package:tb_driver/fetaures/dynamic/auth/screen/signin_screen.dart';
import 'package:tb_driver/utils/comman/my_button.dart';
import 'package:tb_driver/utils/comman/my_text.dart';
import 'package:tb_driver/utils/comman/my_textfeild.dart';
import 'package:tb_driver/utils/comman/sizes.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/constant/app_text.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const SignInScreen()),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            // Title & Subtitle
            MyTextPoppines(
              text: AppText.forgetPasswordTitle,
              fontSize: width * 0.052,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            MyTextPoppines(
              text: AppText.forgetPasswordSubTitle,
              fontSize: width * 0.028,
              fontWeight: FontWeight.w500,
              maxLines: 5,
              color: AppColor.black.withOpacity(0.4),
              height: 1.5,
            ),
            SizedBox(height: height * 0.05),
            // Text field
            MyTextFeild(
              controller: controller,
              headingText: "Email",
              hintText: "Enter your email",
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            CustomButton(
              text: "Submit",
              fontSize: width * 0.042,
              vspacing: height * 0.018,
              onTap: () => Get.to(const ResetPasswordScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
