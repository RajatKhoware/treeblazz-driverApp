import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/comman/my_appbar.dart';

import '../../../../utils/comman/my_button.dart';
import '../../../../utils/comman/my_text.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = '/notification';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBar(text: "Notification"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.045,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.015,
                horizontal: width * 0.03,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.02),
                color: AppColor.greyColor.withOpacity(0.1),
                border: Border.all(
                  color: AppColor.greyColor.withOpacity(0.2),
                ),
              ),
              child: Column(
                children: [
                  buildNotificationsSetting(context, "Effect"),
                  const Divider(),
                  buildNotificationsSetting(context, "Money"),
                  const Divider(),
                  buildNotificationsSetting(context, "Pager Beep"),
                  const Divider(),
                  buildNotificationsSetting(context, "Slow Spring Board"),
                  const Divider(),
                  buildNotificationsSetting(context, "Tictac"),
                  const Divider(),
                  buildNotificationsSetting(context, "Tring"),
                ],
              ),
            ),
          ],
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
            text: "Update",
            onTap: () => Navigator.of(context).pop(),
            vspacing: height * 0.02,
            fontSize: width * 0.048,
          ),
        ),
      ),
    );
  }

  Widget buildNotificationsSetting(BuildContext context, String text) {
    final width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyTextSansPro(
          text: text,
          fontSize: width * 0.048,
          fontWeight: FontWeight.w500,
        ),
        const SwtichButton(),
      ],
    );
  }
}

class SwtichButton extends StatefulWidget {
  const SwtichButton({super.key});

  @override
  State<SwtichButton> createState() => _SwtichButtonState();
}

class _SwtichButtonState extends State<SwtichButton> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.white,
      activeTrackColor: AppColor.redColor,
      inactiveThumbColor: AppColor.white,
      trackOutlineColor: MaterialStateProperty.all(Colors.transparent),

      onChanged: (bool value) {
        setState(() {
          light = value;
        });
      },
    );
  }
}
