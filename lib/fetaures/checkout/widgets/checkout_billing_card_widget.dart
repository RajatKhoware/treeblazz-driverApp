import 'package:flutter/material.dart';

import '../../../res/comman/app_colors.dart';
import '../../../res/comman/my_text.dart';

class CheckoutBillingCard extends StatelessWidget {
  const CheckoutBillingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Container(
          width: width,
          padding: EdgeInsets.symmetric(
            vertical: height * 0.019,
            horizontal: width * 0.04,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.015),
            border: Border.all(
              color: AppColor.greyColor.withOpacity(0.4),
            ),
          ),
          child: Column(
            children: [
              buildDetailes(context, "Sub Total", "320", false),
              buildDetailes(context, "Tax", "0", false),
              buildDetailes(context, "Delivery Charge", "50", false),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Container(
          width: width,
          padding: EdgeInsets.only(
            top: height * 0.022,
            bottom: height * 0.012,
            right: width * 0.04,
            left: width * 0.04,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.015),
            color: AppColor.greyColor.withOpacity(0.4),
          ),
          child: buildDetailes(
            context,
            "Total Paid",
            "370",
            true,
          ),
        ),
      ],
    );
  }

  Widget buildDetailes(
    BuildContext context,
    String title,
    String price,
    bool? isTotal,
  ) {
    final height = MediaQuery.sizeOf(context).height;

    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyTextSansPro(
            text: title,
            fontSize: width * 0.04,
            fontWeight: FontWeight.w600,
          ),
          MyTextPoppines(
            text: "\$$price.0",
            fontSize: width * 0.04,
            fontWeight: FontWeight.w600,
            color: isTotal ?? false ? AppColor.redColor : AppColor.greyColor,
          ),
        ],
      ),
    );
  }
}
