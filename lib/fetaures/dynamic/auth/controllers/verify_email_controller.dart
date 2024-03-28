import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tb_driver/data/repositories/auth_repository.dart';
import 'package:tb_driver/fetaures/dynamic/auth/screen/success_screen.dart';
import 'package:tb_driver/utils/comman/app_snackbar.dart';
import 'package:tb_driver/utils/constant/app_images.dart';
import 'package:tb_driver/utils/constant/app_text.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send Email Whenever Verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthRepository.instance.sendEmailVerification();
      MySnackBar.showSuccess(
        title: "Email Sent",
        message: "Please Check your inbox and verify your email.",
      );
    } catch (e) {
      MySnackBar.showError(title: "Oh Snap!", message: e.toString());
    }
  }

  // Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              image: AppImages.successAnimation,
              title: AppText.yourAccountCreatedTitle,
              subtitle: AppText.yourAccountCreatedSubTitle,
              onTap: () => AuthRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  // Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            image: AppImages.successAnimation,
            title: AppText.yourAccountCreatedTitle,
            subtitle: AppText.yourAccountCreatedSubTitle,
            onTap: () => AuthRepository.instance.screenRedirect(),
          ));
    }
  }
}
