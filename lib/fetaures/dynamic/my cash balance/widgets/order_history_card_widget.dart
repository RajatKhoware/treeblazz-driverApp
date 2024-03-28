import 'package:flutter/cupertino.dart';

import '../../../../utils/constant/app_colors.dart';
import '../../../../utils/comman/my_text.dart';

class OrderHistoryCard extends StatelessWidget {
  final String name;
  final String orderId;
  final String date;
  final String time;
  final String earning;
  const OrderHistoryCard({
    super.key,
    required this.name,
    required this.earning,
    required this.orderId,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.025,
        horizontal: width * 0.03,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.greyColor.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(width * 0.02),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextSansPro(
                text: name,
                fontSize: width * 0.04,
                color: AppColor.black,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.012),
              MyTextSansPro(
                text: "Order #$orderId",
                fontSize: width * 0.038,
                color: const Color(0xFF586E78),
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.012),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.calendar,
                    size: width * 0.04,
                    color: AppColor.redColor,
                  ),
                  SizedBox(width: width * 0.014),
                  MyTextPoppines(
                    text: date,
                    fontSize: width * 0.03,
                    color: AppColor.black,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(width: width * 0.04),
                  Icon(
                    CupertinoIcons.clock,
                    size: width * 0.04,
                    color: AppColor.redColor,
                  ),
                  SizedBox(width: width * 0.014),
                  MyTextPoppines(
                    text: time,
                    fontSize: width * 0.03,
                    color: AppColor.black,
                    fontWeight: FontWeight.w600,
                  )
                ],
              )
            ],
          ),
          MyTextPoppines(
            text: earning,
            fontSize: width * 0.05,
            color: AppColor.redColor,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
