import 'package:flutter/material.dart';
import 'package:tb_driver/res/comman/app_colors.dart';
import 'package:tb_driver/res/comman/my_text.dart';
import 'package:tb_driver/utils/extensions/extensions.dart';

import '../../../res/comman/my_redbutton.dart';
import '../../../res/comman/my_text_feild.dart';
import '../../../utils/validators/validators.dart';
import '../widgets/login_with_socail_widget.dart';
import '../widgets/passwordTextFeild.dart';
import '../widgets/signinup_heading_widget.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = '/signin';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Key to validate form
    final _signInFormKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    // Have to dispose this controllers
    // emailController.dispose();
    // passwordController.dispose();

    void onGetStarted() {
      if (_signInFormKey.currentState!.validate()) {
        context.pushNamedRoute("/bottomBar");
      }
    }

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
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: width * 0.09,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.01),
                    color: AppColor.lightBlue,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColor.darkBlue,
                    size: width / 22,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              const SignInUpHeading(isSignIn: true),
              SizedBox(height: height * 0.03),
              // Textfields
              Form(
                key: _signInFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    MyTextFeild(
                      controller: emailController,
                      headingText: "Email Address",
                      hintText: "Enter your email",
                      validator: Validator().validateEmail,
                    ),
                    PasswordTextFeild(
                      controller: passwordController,
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
                onTap: onGetStarted,
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
