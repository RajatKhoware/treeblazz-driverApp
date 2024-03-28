import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_driver/fetaures/dynamic/auth/screen/signin_screen.dart';
import 'package:tb_driver/fetaures/dynamic/auth/screen/success_screen.dart';
import 'package:tb_driver/utils/comman/my_button.dart';
import 'package:tb_driver/utils/comman/my_text.dart';
import 'package:tb_driver/utils/comman/sizes.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/constant/app_images.dart';
import 'package:tb_driver/utils/constant/app_text.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image
              Image(
                image: const AssetImage(AppImages.deliveredEmailIllustration),
                width: width * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Title & Subtitle
              MyTextPoppines(
                text: AppText.changeYourPasswordTitle,
                fontSize: width * 0.058,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              MyTextPoppines(
                text: "support@treeblazz.com",
                fontSize: width * 0.032,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              MyTextPoppines(
                text: AppText.changeYourPasswordSubTitle,
                fontSize: width * 0.03,
                fontWeight: FontWeight.w500,
                maxLines: 5,
                color: AppColor.black.withOpacity(0.6),
                height: 1.5,
                textAlign: TextAlign.center,
              ),

              // Buttons
              const SizedBox(height: TSizes.spaceBtwSections),
              CustomButton(
                text: "Done",
                fontSize: width * 0.042,
                vspacing: height * 0.018,
                onTap: () => Get.to(
                  SuccessScreen(
                    image: AppImages.staticSuccessIllustration,
                    title: AppText.yourAccountCreatedTitle,
                    subtitle: AppText.yourAccountCreatedSubTitle,
                    onTap: () => Get.to(() => const SignInScreen()),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              CustomButton(
                text: "Resend Email",
                fontSize: width * 0.035,
                fontColor: AppColor.redColor,
                buttonColor: AppColor.white,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
