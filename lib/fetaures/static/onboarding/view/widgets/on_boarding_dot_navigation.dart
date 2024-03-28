import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tb_driver/fetaures/static/onboarding/controller/onboarding_controller.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';

class OnBoradingDotNavigation extends StatelessWidget {
  const OnBoradingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final controller = OnboardingController.instance;
    return SmoothPageIndicator(
      controller: controller.pageController,
      count: 3,
      onDotClicked: controller.dotNavigationClick,
      effect: ExpandingDotsEffect(
        dotHeight: height * 0.01,
        dotWidth: width * 0.04,
        dotColor: Colors.grey.shade300,
        activeDotColor: AppColor.redColor,
        spacing: width * 0.02,
      ),
    );
  }
}
