import 'package:flutter/material.dart';
import 'package:tb_driver/res/comman/app_colors.dart';

import '../../../res/comman/my_redbutton.dart';
import '../../../res/comman/my_text.dart';

class SignInUpHeading extends StatelessWidget {
  final bool isSignIn;
  const SignInUpHeading({super.key, required this.isSignIn});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTextPoppines(
              text: isSignIn ? "Sign in" : "Sign up",
              fontSize: width * 0.08,
              fontWeight: FontWeight.w600,
            ),
            CustomButton(
              onTap: () {
                isSignIn
                    ? Navigator.pushNamed(context, '/signup')
                    : Navigator.pushNamed(context, '/signin');
              },
              hspacing: width * 0.05,
              text: isSignIn ? "Sign up" : "Sign in",
              fontSize: width * 0.04,
              fontWeight: FontWeight.w600,
              buttonColor: const Color.fromARGB(255, 223, 221, 221),
              fontColor: AppColor.redColor,
            ),
          ],
        ),
        SizedBox(height: height * 0.01),
        MyTextPoppines(
          text: isSignIn
              ? "First login your account"
              : "Create your free account",
          fontSize: width * 0.035,
          color: Colors.black.withOpacity(0.4),
        ),
      ],
    );
  }
}
