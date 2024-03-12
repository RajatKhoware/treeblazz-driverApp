import 'package:flutter/material.dart';
import 'package:tb_driver/res/comman/my_text.dart';

class SplashScreen03 extends StatelessWidget {
  const SplashScreen03({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.03, horizontal: width * 0.045),

          ///  padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.12),
              SizedBox(
                width: width,
                height: height * 0.5,
                child: Image.asset(
                  "assets/img/splash01.png",
                  fit: BoxFit.cover,
                ),
              ),
              MyTextSansPro(
                text: "Welcome",
                fontSize: width * 0.09,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.01),
              MyTextPoppines(
                text:
                    "Cillum ullamco dolor Lorem laboris aliqua adipisicing duis qui anim adipisicing elit officia.",
                fontSize: width * 0.035,
                color: Colors.black.withOpacity(0.4),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
