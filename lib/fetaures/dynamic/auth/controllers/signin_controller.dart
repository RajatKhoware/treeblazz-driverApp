import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tb_driver/controllers/network_controller.dart';
import 'package:tb_driver/controllers/user_controller.dart';
import 'package:tb_driver/data/repositories/auth_repository.dart';
import 'package:tb_driver/fetaures/static/navigation%20menu/view/app_navigation_menu.dart';
import 'package:tb_driver/utils/comman/app_snackbar.dart';
import 'package:tb_driver/utils/constant/app_images.dart';

import '../../../../utils/popups/full_screen_loader.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final signInFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final userController = Get.put(UserController());
  // @override
  // void onInit() {
  //   emailController.text = localStorage.read("REMEMBER_ME_EMAIL");
  //   passwordController.text = localStorage.read("REMEMBER_ME_PASSWORD");
  //   super.onInit();
  // }

  // -- Email and Password Signin
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
        "Logging you in...",
        AppImages.loadingAnimation,
      );

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MySnackBar.showError(
          title: "No Internet Connection",
          message: "Connect to a network for making this request",
        );
        // Remove Loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signInFormKey.currentState!.validate()) {
        // Remove Loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", emailController.text.trim());
        localStorage.write(
            "REMEMBER_ME_PASSWORD", passwordController.text.trim());
      }

      // Signin user using Email & Password Authenticaton
      final userCredential = await AuthRepository.instance
          .signinWithEmailAndPassword(
            emailController.text.trim(),
            passwordController.text.trim(),
          )
          .onError((error, stackTrace) => FullScreenLoader.stopLoading());

      // Remove Loader
      FullScreenLoader.stopLoading();

      // Show Success Message
      MySnackBar.showSuccess(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.',
      );

      // If Email is Verifed Move to HOme.
      Get.to(() => const NavigationMenu());
    } catch (e) {
      // Show some Generic Error to the user'
      MySnackBar.showError(title: e.toString());
    }
  }

  // -- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
        "Logging you in...",
        AppImages.loadingAnimation,
      );

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredential = await AuthRepository.instance.signInWIthGoogle();

      // Store User Record
      await userController.saveUserRecord(userCredential);

      // Remove Loader
      FullScreenLoader.stopLoading();

      // Redirect
      AuthRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      FullScreenLoader.stopLoading();
      // Show some Generic Error to the user'
      MySnackBar.showError(title: e.toString());
    }
  }
}
