import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tb_driver/res/comman/app_colors.dart';
import 'package:tb_driver/res/comman/app_images.dart';
import 'package:tb_driver/res/comman/my_redbutton.dart';
import 'package:tb_driver/res/comman/my_text.dart';
import 'package:tb_driver/utils/extensions/extensions.dart';

class HomeOrderCard extends StatelessWidget {
  const HomeOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        vertical: height * 0.015,
        horizontal: width * 0.035,
      ),
      margin: EdgeInsets.symmetric(vertical: height * 0.015),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.015),
        border: Border.all(
          color: AppColor.greyColor.withOpacity(0.4),
        ),
      ),
      child: Column(
        children: [
          // Img + Name + Order Date + Order Time
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.22,
                height: height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.02),
                  color: AppColor.black,
                  image: const DecorationImage(
                    image: AssetImage(AppImages.man),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: width * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextSansPro(
                    text: "Taelyann Thorpe",
                    fontSize: width * 0.048,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildTimeNDate(context, Icons.date_range, "30 Dec 2024"),
                      SizedBox(width: width * 0.05),
                      buildTimeNDate(context, CupertinoIcons.clock, "05:15 PM"),
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: height * 0.025),
          // Order No + Delivery + Cost + Payment
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOrderDetails(
                context,
                "Order no.",
                "#39994",
              ),
              buildOrderDetails(
                context,
                "Delivery",
                "30 Min",
              ),
              buildOrderDetails(
                context,
                "Cost",
                "\$50",
              ),
              buildOrderDetails(
                context,
                "Payment",
                "COD",
              ),
            ],
          ),
          // Cancell + Accept Order Button
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: "Cancel",
                buttonColor: AppColor.white,
                hspacing: width * 0.1,
                fontSize: width * 0.045,
                fontColor: AppColor.black.withOpacity(0.5),
                onTap: () {},
              ),
              CustomButton(
                text: "Accept Order",
                hspacing: width * 0.06,
                fontSize: width * 0.045,
                onTap: () => context.pushNamedRoute("/checkout"),
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
        ],
      ),
    );
  }

  Widget buildTimeNDate(
    BuildContext context,
    IconData icon,
    String text,
  ) {
    final width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        Icon(
          icon,
          color: AppColor.redColor,
          size: width * 0.045,
        ),
        SizedBox(width: width * 0.015),
        MyTextPoppines(
          text: text,
          fontSize: width * 0.033,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }

  Widget buildOrderDetails(
    BuildContext context,
    String heading,
    String detaile,
  ) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextSansPro(
          text: heading,
          fontSize: width * 0.038,
          color: AppColor.black.withOpacity(0.7),
          fontWeight: FontWeight.w500,
        ),
        MyTextPoppines(
          text: detaile,
          fontSize: width * 0.038,
          color: AppColor.black,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
