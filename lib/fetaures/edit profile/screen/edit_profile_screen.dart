import 'package:flutter/material.dart';
import 'package:tb_driver/res/comman/app_images.dart';
import 'package:tb_driver/res/comman/my_appbar.dart';
import 'package:tb_driver/res/comman/my_text_feild.dart';

import '../../../res/comman/my_redbutton.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = '/editProfile';
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBar(text: "Edit Profile"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.05,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.24),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: width * 0.18,
                    backgroundImage: const AssetImage(AppImages.man),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 10,
                    child: CircleAvatar(
                      radius: width * 0.04,
                      backgroundColor: const Color.fromARGB(255, 206, 206, 206),
                      child: Icon(
                        Icons.edit,
                        size: width * 0.05,
                      ),
                    ),
                  )
                ],
              ),
            ),
            MyTextFeild(
              controller: nameController,
              headingText: "Full Name",
              hintText: "John Doe",
            ),
            MyTextFeild(
              controller: phoneController,
              headingText: "Phone Number",
              hintText: "+91 85495-90567",
            ),
            MyTextFeild(
              controller: emailController,
              headingText: "Email Address",
              hintText: "johndoe@gmail.com",
            )
          ],
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
