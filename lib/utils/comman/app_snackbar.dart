import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';

class MySnackBar {
  static void show(BuildContext context, String content) {
    final snackBar = SnackBar(
      content: Text(content),
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void warning(BuildContext context, String content) {
    final snackBar = SnackBar(
      backgroundColor: AppColor.warningColor,
      content: Text(content),
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void error(BuildContext context, String content) {
    final snackBar = SnackBar(
      backgroundColor: AppColor.errorColor,
      content: Text(content),
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showWarning({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: const Color.fromARGB(255, 255, 166, 0),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.warning_2,
        color: AppColor.white,
      ),
    );
  }

  static void showError({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: AppColor.redColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.warning_2,
        color: AppColor.white,
      ),
    );
  }

  static void showSuccess({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: AppColor.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.copy_success,
        color: AppColor.white,
      ),
    );
  }
}
