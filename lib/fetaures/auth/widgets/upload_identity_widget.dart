import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/comman/my_redbutton.dart';
import '../../../res/comman/my_text.dart';

class SignupUploadIdentity extends StatelessWidget {
  const SignupUploadIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.02),
        MyTextPoppines(
          text: "Upload identity",
          fontSize: width * 0.038,
          color: Colors.black.withOpacity(0.4),
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: height * 0.015),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  CupertinoIcons.link,
                  size: width * 0.05,
                ),
                SizedBox(width: width * 0.02),
                MyTextPoppines(
                  text: "DrivingDoc.pdf",
                  fontSize: width * 0.03,
                  color: Colors.black.withOpacity(0.4),
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            CustomButton(
              text: "Choose file",
              fontSize: width * 0.04,
              hspacing: width * 0.07,
              vspacing: height * 0.016,
              onTap: () {},
            )
          ],
        ),
      ],
    );
  }
}
