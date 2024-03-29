import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tb_driver/fetaures/static/bottom%20bar/view/app_bottomBar.dart';
import 'package:tb_driver/fetaures/static/navigation%20menu/controller/navigation_menu_controller.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/constant/app_images.dart';
import 'package:tb_driver/utils/comman/my_text.dart';
import 'package:tb_driver/utils/extensions/extensions.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final navigationMenuController = NavigationMenuController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                navigationMenuController.onItemTapped(2);
              },
              child: CircleAvatar(
                radius: width * 0.065,
                backgroundImage: const AssetImage(
                  AppImages.man,
                ),
              ),
            ),
            SizedBox(width: width * 0.03),
            MyTextSansPro(
              text: "Madbrains",
              fontSize: width * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.014,
            horizontal: width * 0.04,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
            color: AppColor.redColor,
          ),
          child: Row(
            children: [
              Icon(
                CupertinoIcons.location_solid,
                color: AppColor.white,
                size: width * 0.04,
              ),
              SizedBox(width: width * 0.015),
              MyTextSansPro(
                text: "California",
                fontSize: width * 0.036,
                fontWeight: FontWeight.w500,
                color: AppColor.white,
              ),
            ],
          ),
        )
      ],
    );
  }
}
