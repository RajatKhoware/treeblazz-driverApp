import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_driver/controllers/network_controller.dart';
import 'package:tb_driver/data/models/user_model.dart';
import 'package:tb_driver/data/repositories/auth_repository.dart';
import 'package:tb_driver/data/repositories/user_repository.dart';
import 'package:tb_driver/fetaures/dynamic/auth/screen/verify_email_screen.dart';
import 'package:tb_driver/utils/comman/app_snackbar.dart';
import 'package:tb_driver/utils/constant/app_images.dart';
import 'package:tb_driver/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final Rx<bool> _isTNCAccepted = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  FocusNode nameNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  FocusNode addressNode = FocusNode();

  /// Getters
  bool get isTNCAccepted => _isTNCAccepted.value;

  // on Terms and Conditions Clicked
  void onTNCTapped() => _isTNCAccepted.value = !_isTNCAccepted.value;

  // SIGNUP
  Future<void> onSignUp(BuildContext context) async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
        "We are processing your information...",
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
      if (!signUpFormKey.currentState!.validate()) {
        // Remove Loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!_isTNCAccepted.value) {
        // Remove Loader
        FullScreenLoader.stopLoading();
        MySnackBar.showWarning(
          title: "Accept Privacy Policy",
          message:
              "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.",
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthRepository.instance
          .registerWithEmailAndPassword(
            emailController.text.trim(),
            passwordController.text.trim(),
          )
          .onError((error, stackTrace) => FullScreenLoader.stopLoading());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        userName: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser).onError(
            (error, stackTrace) => FullScreenLoader.stopLoading(),
          );

      // Remove Loader
      FullScreenLoader.stopLoading();

      // Show Success Message
      MySnackBar.showSuccess(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.',
      );

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: emailController.text.trim()));
    } catch (e) {
      // Remove Loader
      FullScreenLoader.stopLoading();
      // Show some Generic Error to the user'
      MySnackBar.showWarning(title: e.toString());
    }
  }
}
