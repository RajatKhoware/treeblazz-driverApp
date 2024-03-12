import 'package:flutter/cupertino.dart';
import 'package:tb_driver/res/comman/app_colors.dart';

import '../../../res/comman/my_text.dart';

class EarningHistoryCard extends StatelessWidget {
  final String headingText;
  final String earning;
  const EarningHistoryCard(
      {super.key, required this.headingText, required this.earning});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.06,
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
                text: headingText,
                fontSize: width * 0.04,
                color: AppColor.black,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.006),
              MyTextPoppines(
                text: "\$$earning.00",
                fontSize: width * 0.045,
                color: AppColor.redColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Icon(
            CupertinoIcons.chevron_right,
            size: width * 0.06,
          )
        ],
      ),
    );
  }
}
