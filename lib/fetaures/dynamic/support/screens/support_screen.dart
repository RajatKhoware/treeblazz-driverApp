import 'package:flutter/material.dart';
import 'package:tb_driver/utils/constant/app_images.dart';
import 'package:tb_driver/utils/comman/my_appbar.dart';
import 'package:tb_driver/utils/comman/my_textfeild.dart';

import '../../../../utils/comman/my_button.dart';

class SupportScreen extends StatelessWidget {
  static const String routeName = '/support';
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController();
    return Scaffold(
      appBar: const MyAppBar(text: "Help & Support"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.045,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.support,
                  width: width * 0.7,
                  height: height * 0.32,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: height * 0.03),
              MyTextFeild(
                controller: nameController,
                headingText: "Name",
                hintText: "Enter your name",
              ),
              MyTextFeild(
                controller: emailController,
                headingText: "Email",
                hintText: "Enter your email",
              ),
              MyTextFeild(
                controller: messageController,
                headingText: "Query",
                hintText: "Enter your query here",
                maxLines: 4,
              ),
              SizedBox(height: height * 0.03),
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
          height: height * 0.075,
          child: CustomButton(
            text: "Send",
            onTap: () => Navigator.of(context).pop(),
            vspacing: height * 0.02,
            fontSize: width * 0.05,
          ),
        ),
      ),
    );
  }
}
