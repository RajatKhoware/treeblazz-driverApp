import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_driver/fetaures/dynamic/auth/controllers/signin_controller.dart';
import 'package:tb_driver/fetaures/dynamic/auth/controllers/signup_controller.dart';
import 'package:tb_driver/fetaures/static/navigation%20menu/view/app_navigation_menu.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/comman/my_text.dart';
import 'package:tb_driver/utils/extensions/extensions.dart';

import '../../../../utils/comman/my_button.dart';
import '../../../../utils/comman/my_textfeild.dart';
import '../../../../utils/validators/validators.dart';
import '../widgets/login_with_socail_widget.dart';
import '../widgets/passwordTextFeild.dart';
import '../widgets/signinup_heading_widget.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = '/signin';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SigninController());

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.03,
            horizontal: width * 0.045,
          ),
          // back button
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),
              const SignInUpHeading(isSignIn: true),
              SizedBox(height: height * 0.03),
              // Textfields
              Form(
                key: controller.signInFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    MyTextFeild(
                      controller: controller.emailController,
                      headingText: "Email Address",
                      hintText: "Enter your email",
                      validator: Validator().validateEmail,
                    ),
                    PasswordTextFeild(
                      controller: controller.passwordController,
                      headingText: "Password",
                      hintText: "Enter your password",
                      validator: Validator().validatePassword,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              // forget pass
              Align(
                alignment: Alignment.bottomRight,
                child: MyTextPoppines(
                  text: "Forget Password ?",
                  fontSize: width * 0.035,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // SignIn button
              SizedBox(height: height * 0.08),
              CustomButton(
                text: "Get Started",
                onTap: () => Get.to(() => const NavigationMenu()),
                // onTap: controller.emailAndPasswordSignIn,
              ),
              SizedBox(height: height * 0.02),
              // Login with social
              const LoginWithSocialWidget()
            ],
          ),
        ),
      ),
    );
  }
}
