import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_driver/fetaures/dynamic/auth/controllers/signup_controller.dart';
import 'package:tb_driver/fetaures/dynamic/auth/widgets/passwordTextFeild.dart';
import 'package:tb_driver/fetaures/static/navigation%20menu/view/app_navigation_menu.dart';
import 'package:tb_driver/utils/comman/my_textfeild.dart';
import 'package:tb_driver/utils/extensions/extensions.dart';

import '../../../../utils/constant/app_colors.dart';
import '../../../../utils/comman/my_button.dart';
import '../../../../utils/comman/my_text.dart';
import '../../../../utils/utils.dart';
import '../../../../utils/validators/validators.dart';
import '../widgets/custom_checkbox_widget.dart';
import '../widgets/login_with_socail_widget.dart';
import '../widgets/signinup_heading_widget.dart';
import '../widgets/upload_identity_widget.dart';
import '../widgets/vehicleSelectionDropdown_widget.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    // Key to validate form
    final _signUpFormKey = GlobalKey<FormState>();
    // Controllers
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confrimPasswordController = TextEditingController();

    // Nodes
    FocusNode nameNode = FocusNode();
    FocusNode phoneNode = FocusNode();
    FocusNode emailNode = FocusNode();
    FocusNode passwordNode = FocusNode();
    FocusNode confirmPasswordNode = FocusNode();

    void onSignUp() {
      Get.to(() => const NavigationMenu());
    }

    final controller = Get.put(SignupController());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.045,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),
              // Signup + Signin Button + Create your free account
              const SignInUpHeading(isSignIn: false),
              SizedBox(height: height * 0.03),
              // Textfields
              Form(
                key: _signUpFormKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    MyTextFeild(
                      controller: nameController,
                      headingText: "Full Name",
                      hintText: "Jhon deo",
                      focusNode: nameNode,
                      validator: Validator().nullValidator,
                      onSubmit: (p0) {
                        Utils.fieldFocusChange(context, nameNode, phoneNode);
                      },
                    ),
                    MyTextFeild(
                      controller: phoneController,
                      headingText: "Phone Number",
                      hintText: "79493**00",
                      focusNode: phoneNode,
                      validator: Validator().validateContactNo,
                      onSubmit: (p0) {
                        Utils.fieldFocusChange(context, phoneNode, emailNode);
                      },
                    ),
                    MyTextFeild(
                      controller: emailController,
                      headingText: "Email Address",
                      hintText: "****@gmail.com",
                      focusNode: emailNode,
                      validator: Validator().validateEmail,
                      onSubmit: (p0) {
                        Utils.fieldFocusChange(
                            context, emailNode, passwordNode);
                      },
                    ),
                    PasswordTextFeild(
                      controller: passwordController,
                      headingText: "Password",
                      hintText: "**********",
                      focusNode: passwordNode,
                      validator: Validator().validatePassword,
                      onSubmit: (p0) {
                        Utils.fieldFocusChange(
                            context, passwordNode, confirmPasswordNode);
                      },
                    ),
                    PasswordTextFeild(
                      controller: confrimPasswordController,
                      headingText: "Confrim Password",
                      hintText: "***********",
                      focusNode: confirmPasswordNode,
                      validator: (value) {
                        return Validator().validateConfirmPassword(
                          value: value,
                          valController: passwordController.text,
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.01),
              // Dropdown
              const VehicleSelectionDropdown(),
              SizedBox(height: height * 0.01),
              // Upload identity
              const SignupUploadIdentity(),
              // -- Accept T&C Check
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CustomCheckbox(),
                  SizedBox(width: width * 0.04),
                  SizedBox(
                    width: width * 0.8,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Accept  ',
                            style: TextStyle(
                              fontSize: width * 0.034,
                              color: Colors.transparent,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.6),
                                  offset: const Offset(0, -2),
                                )
                              ],
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              fontSize: width * 0.034,
                              height: 1.9,
                              fontWeight: FontWeight.w500,
                              color: Colors.transparent,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.darkBlue,
                              shadows: const [
                                Shadow(
                                  color: AppColor.darkBlue,
                                  offset: Offset(0, -2),
                                )
                              ],
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: '  and  ',
                            style: TextStyle(
                              fontSize: width * 0.034,
                              color: Colors.transparent,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.6),
                                  offset: const Offset(0, -2),
                                )
                              ],
                            ),
                          ),
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(
                              fontSize: width * 0.034,
                              height: 1.9,
                              fontWeight: FontWeight.w500,
                              color: Colors.transparent,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.darkBlue,
                              shadows: const [
                                Shadow(
                                  color: AppColor.darkBlue,
                                  offset: Offset(0, -2),
                                )
                              ],
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.04),
              CustomButton(
                text: "Sign Up",
                onTap: onSignUp,
              ),
              SizedBox(height: height * 0.01),
              const LoginWithSocialWidget()
            ],
          ),
        ),
      ),
    );
  }
}
