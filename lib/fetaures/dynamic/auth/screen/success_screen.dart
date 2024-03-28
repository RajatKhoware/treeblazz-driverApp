import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tb_driver/utils/comman/my_button.dart';
import 'package:tb_driver/utils/comman/my_text.dart';
import 'package:tb_driver/utils/comman/sizes.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';

class SuccessScreen extends StatelessWidget {
  final String image, title, subtitle;
  final VoidCallback onTap;
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.09),
          child: Column(
            children: [
              SizedBox(height: height * 0.136),
              // Image
              Lottie.asset(image),
              // Image(
              //   image: AssetImage(image),
              //   width: width * 0.6,
              // ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Title & Subtitle
              MyTextPoppines(
                text: title,
                fontSize: width * 0.058,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              MyTextPoppines(
                text: subtitle,
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
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
