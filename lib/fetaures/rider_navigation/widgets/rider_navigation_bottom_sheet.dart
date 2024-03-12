import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tb_driver/res/comman/app_colors.dart';
import 'package:tb_driver/res/comman/my_text.dart';

class RiderNavigationBottoSheet extends StatelessWidget {
  const RiderNavigationBottoSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      height: height * 0.45,
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(width * 0.1),
          topRight: Radius.circular(width * 0.1),
        ),
        color: AppColor.white,
      ),
      child: Column(
        children: [
          Container(
            width: width * 0.12,
            height: height * 0.006,
            margin: EdgeInsets.symmetric(vertical: height * 0.015),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColor.greyColor.withOpacity(0.4),
            ),
          ),
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildRowforTimeandDistance(
                context,
                "Destination Time",
                "30",
                CupertinoIcons.clock,
              ),
              buildRowforTimeandDistance(
                context,
                "Distance",
                "2.5 km",
                CupertinoIcons.location_solid,
              ),
            ],
          ),
          Divider(
            height: height * 0.05,
            color: AppColor.greyColor.withOpacity(0.2),
          ),
          // Your Location
          Row(
            children: [
              Icon(
                Icons.location_searching_sharp,
                color: AppColor.redColor,
                size: width * 0.06,
              ),
              SizedBox(width: width * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextPoppines(
                    text: "Your",
                    fontSize: width * 0.035,
                    color: AppColor.greyColor,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: height * 0.004),
                  SizedBox(
                    width: width * 0.7,
                    child: MyTextPoppines(
                      text: "Pipewala Building, H Pasta Lane, Colaba",
                      maxLines: 1,
                      fontSize: width * 0.036,
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: height * 0.04),
          Row(
            children: [
              Icon(
                Icons.location_searching_sharp,
                color: AppColor.green,
                size: width * 0.06,
              ),
              SizedBox(width: width * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextPoppines(
                    text: "Buyer",
                    fontSize: width * 0.035,
                    color: AppColor.greyColor,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: height * 0.004),
                  SizedBox(
                    width: width * 0.7,
                    child: MyTextPoppines(
                      text: "Antila Building, H Pasta Lane, Bandra",
                      maxLines: 1,
                      fontSize: width * 0.036,
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: height * 0.04),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(vertical: height * 0.022),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.02),
              color: AppColor.redColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  color: AppColor.white,
                  size: width * 0.06,
                ),
                SizedBox(width: width * 0.04),
                MyTextPoppines(
                  text: "Call Buyers",
                  maxLines: 1,
                  fontSize: width * 0.043,
                  color: AppColor.white,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildRowforTimeandDistance(
    BuildContext context,
    String heading,
    String title,
    IconData icon,
  ) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        Icon(
          icon,
          color: AppColor.redColor,
          size: width * 0.08,
        ),
        SizedBox(width: width * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextPoppines(
              text: heading,
              fontSize: width * 0.035,
              color: AppColor.greyColor,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: height * 0.004),
            MyTextPoppines(
              text: title,
              fontSize: width * 0.04,
              color: AppColor.black,
              fontWeight: FontWeight.w600,
            ),
          ],
        )
      ],
    );
  }
}
