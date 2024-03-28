import 'package:flutter/material.dart';
import 'package:tb_driver/data/repositories/auth_repository.dart';
import 'package:tb_driver/utils/constant/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static void startTimer() {
    Future.delayed(const Duration(seconds: 2), () {
      AuthRepository.instance.screenRedirect();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splash),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
