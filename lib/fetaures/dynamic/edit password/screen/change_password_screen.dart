import 'package:flutter/material.dart';
import 'package:tb_driver/fetaures/dynamic/auth/widgets/passwordTextFeild.dart';
import 'package:tb_driver/utils/comman/my_appbar.dart';

import '../../../../utils/comman/my_button.dart';
import '../../../../utils/utils.dart';
import '../../../../utils/validators/validators.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String routeName = '/changePassword';
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    // Key to validate form
    final _passwordFormKey = GlobalKey<FormState>();

    // Controllers
    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    // Nodes
    FocusNode oldPasswordNode = FocusNode();
    FocusNode passwordNode = FocusNode();
    FocusNode confirmPasswordNode = FocusNode();

    return Scaffold(
      appBar: const MyAppBar(text: "Change Password"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.06,
        ),
        child: Form(
          key: _passwordFormKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              PasswordTextFeild(
                controller: oldPasswordController,
                headingText: "Current Password",
                hintText: "Enter old password",
                validator: Validator().validatePassword,
                focusNode: oldPasswordNode,
                onSubmit: (p0) {
                  Utils.fieldFocusChange(
                      context, oldPasswordNode, passwordNode);
                },
              ),
              PasswordTextFeild(
                controller: newPasswordController,
                headingText: "New Password",
                hintText: "Enter new password",
                focusNode: passwordNode,
                validator: Validator().validatePassword,
                onSubmit: (p0) {
                  Utils.fieldFocusChange(
                      context, passwordNode, confirmPasswordNode);
                },
              ),
              PasswordTextFeild(
                controller: confirmPasswordController,
                headingText: "Confirm Password",
                hintText: "Enter confirm password",
                focusNode: confirmPasswordNode,
                validator: (value) {
                  return Validator().validateConfirmPassword(
                    value: value,
                    valController: newPasswordController.text,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.062,
          vertical: height * 0.02,
        ),
        child: SizedBox(
          height: height * 0.07,
          child: CustomButton(
            text: "Update",
            onTap: () => Navigator.of(context).pop(),
            vspacing: height * 0.02,
            fontSize: width * 0.05,
          ),
        ),
      ),
    );
  }
}
