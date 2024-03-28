import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tb_driver/fetaures/dynamic/auth/screen/signin_screen.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();
  // Varibales
  final PageController pageController = PageController();
  Rx<int> currentIndex = 0.obs;

  // Update Current Page When page Scroll
  void onPageUpdateIndicator(index) {
    currentIndex.value = index;
  }

  // Jump to specific dot selected Page
  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.jumpTo(index);
  }

  // Update Current Index and jump to next page
  // void nextPage() {
  //   if (currentIndex.value == 2) {
  //     final storage = GetStorage();
  //     storage.write("isFirstTime", false);
  //     Get.offAll(const SignInScreen());
  //   } else {
  //     int page = currentIndex.value + 1;
  //     pageController.jumpToPage(page);
  //   }
  // }

  // Update current index and jump to last Page
  void skipPage() {
    final storage = GetStorage();
    storage.write("isFirstTime", false);
    currentIndex.value = 2;
    pageController.jumpToPage(2);
    Get.offAll(const SignInScreen());
  }
}
