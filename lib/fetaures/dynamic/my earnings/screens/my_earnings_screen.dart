import 'package:flutter/material.dart';
import 'package:tb_driver/fetaures/dynamic/my%20earnings/widgets/earning_history_card_widget.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/constant/app_list.dart';

import '../../../../utils/comman/my_appbar.dart';
import '../../../../utils/comman/my_text.dart';

class MyEarningScreen extends StatelessWidget {
  static const String routeName = '/myEarning';
  const MyEarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBar(text: "My Earning"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.055,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total earning container
            Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.03,
                horizontal: width * 0.05,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.03),
                color: const Color(0xFFEFEFEF),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    size: width * 0.18,
                    color: AppColor.black.withOpacity(0.8),
                  ),
                  SizedBox(width: width * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextPoppines(
                        text: "\$5679.00",
                        fontSize: width * 0.055,
                        color: AppColor.redColor,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: height * 0.006),
                      MyTextSansPro(
                        text: "Total Earning",
                        fontSize: width * 0.045,
                        color: const Color(0xFF586E78),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            // List of Earning History
            MyTextSansPro(
              text: "Earning History",
              fontSize: width * 0.06,
              color: AppColor.black,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: height * 0.01),
            Expanded(
              child: ListView.builder(
                itemCount: AppList.earings.length,
                itemBuilder: (context, index) {
                  String heading = AppList.earings[index].title;
                  String earings = AppList.earings[index].earning;
                  return EarningHistoryCard(
                    headingText: heading,
                    earning: earings,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
