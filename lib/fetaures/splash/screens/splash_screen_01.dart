import 'package:flutter/material.dart';

class SplashScreen01 extends StatelessWidget {
  const SplashScreen01({super.key});

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
            image: AssetImage("assets/img/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
