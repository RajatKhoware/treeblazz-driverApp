import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_driver/data/repositories/auth_repository.dart';
import 'package:tb_driver/fetaures/dynamic/auth/controllers/verify_email_controller.dart';
import 'package:tb_driver/utils/comman/my_button.dart';
import 'package:tb_driver/utils/comman/my_text.dart';
import 'package:tb_driver/utils/comman/sizes.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/constant/app_images.dart';
import 'package:tb_driver/utils/constant/app_text.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String? email;
  const VerifyEmailScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      /// The close icon in the app bar is used to log out the user and redirect back to the login screen.
      /// This approach is taken to handle scenarios where the user enters the registration process.
      /// end the date is stored. Upon reopening the app, it checks if the email is verified.
      /// If not verified, the app always navigates to the verification screen.

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthRepository.instance.logout(),
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
                text: AppText.confirmEmail,
                fontSize: width * 0.058,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              MyTextPoppines(
                text: email ?? "support@treeblazz.com",
                fontSize: width * 0.032,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              MyTextPoppines(
                text: AppText.confirmEmailSubTitle,
                fontSize: width * 0.03,
                fontWeight: FontWeight.w500,
                maxLines: 5,
                color: AppColor.black.withOpacity(0.4),
                height: 1.5,
                textAlign: TextAlign.center,
              ),

              // Buttons
              const SizedBox(height: TSizes.spaceBtwSections),
              CustomButton(
                text: "Conutine",
                fontSize: width * 0.042,
                vspacing: height * 0.018,
                onTap: () => controller.checkEmailVerificationStatus(),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              CustomButton(
                text: "Resend Email",
                fontSize: width * 0.035,
                fontColor: AppColor.redColor,
                buttonColor: AppColor.white,
                onTap: () => controller.sendEmailVerification(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
