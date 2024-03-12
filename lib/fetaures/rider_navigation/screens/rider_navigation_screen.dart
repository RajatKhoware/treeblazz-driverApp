import 'package:flutter/material.dart';
import 'package:tb_driver/res/comman/app_colors.dart';
import 'package:tb_driver/res/comman/app_images.dart';

import '../widgets/rider_navigation_bottom_sheet.dart';

class RiderNavigationScreen extends StatelessWidget {
  static const String routeName = '/riderNavigation';
  const RiderNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: width,
                height: height * 0.8,
                decoration: const BoxDecoration(
                  color: AppColor.black,
                  image: DecorationImage(
                    image: AssetImage(AppImages.map),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.05,
                  horizontal: width * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildButtons(
                          context,
                          () => Navigator.of(context).pop(),
                          Icons.arrow_back_ios_new,
                        ),
                        buildButtons(
                          context,
                          () {},
                          Icons.language,
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.025),
                    buildButtons(
                      context,
                      () {},
                      Icons.location_searching_sharp,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      bottomSheet: const RiderNavigationBottoSheet(),
    );
  }

  Widget buildButtons(BuildContext context, VoidCallback onTap, IconData icon) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width * 0.09,
        height: height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.01),
          color: AppColor.white,
        ),
        child: Icon(
          icon,
          color: AppColor.black,
          size: width / 22,
        ),
      ),
    );
  }
}
