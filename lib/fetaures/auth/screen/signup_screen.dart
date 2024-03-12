import 'package:flutter/material.dart';
import 'package:tb_driver/fetaures/auth/widgets/passwordTextFeild.dart';
import 'package:tb_driver/res/comman/my_text_feild.dart';
import 'package:tb_driver/utils/extensions/extensions.dart';

import '../../../res/comman/app_colors.dart';
import '../../../res/comman/my_redbutton.dart';
import '../../../res/comman/my_text.dart';
import '../../../utils/utils.dart';
import '../../../utils/validators/validators.dart';
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
      // if (_signUpFormKey.currentState!.validate()) {
      //   context.pushNamedRoute("/bottomBar");
      // }
      context.pushNamedRoute("/bottomBar");
    }

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
              // Dropdown
              const VehicleSelectionDropdown(),
              // Upload identity
              const SignupUploadIdentity(),
              // Check box + Text
              SizedBox(height: height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomCheckbox(),
                  SizedBox(
                    width: width * 0.8,
                    child: MyTextPoppines(
                      text:
                          "By doing signup you agree with all Terms and Conditions",
                      fontSize: width * 0.035,
                      color: Colors.black,
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
