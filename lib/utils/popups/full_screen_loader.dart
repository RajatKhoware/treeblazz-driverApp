import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/loaders/animation_loader.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context:
          Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
      barrierDismissible:
          false, // The dialog cant be dismissed by tapping outside it

      builder: (_) => PopScope(
        canPop: false, // Disable the poping with the back button
        child: Container(
          color: AppColor.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              AnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  // Stop the currently open loading dialog
  // This method dosen't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
