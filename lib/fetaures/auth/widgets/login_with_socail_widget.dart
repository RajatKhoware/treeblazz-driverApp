import 'package:flutter/material.dart';

import '../../../res/comman/my_text.dart';

class LoginWithSocialWidget extends StatelessWidget {
  const LoginWithSocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.02),
        Row(
          children: [
            SizedBox(
              width: width * 0.28,
              child: Divider(
                endIndent: width * 0.04,
              ),
            ),
            MyTextPoppines(
              text: "Login with social",
              fontSize: width * 0.04,
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              width: width * 0.28,
              child: Divider(
                indent: width * 0.04,
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildIcons(context, 'assets/icon/facebook.png', () {}),
            buildIcons(context, 'assets/icon/instagram.png', () {}),
            buildIcons(context, 'assets/icon/twitter.png', () {})
          ],
        ),
      ],
    );
  }

  Widget buildIcons(BuildContext context, String img, VoidCallback onTap) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width * 0.25,
        height: height * 0.07,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
