import 'package:flutter/material.dart';
import 'package:tb_driver/res/comman/app_list.dart';

import '../../../res/comman/app_colors.dart';
import '../../../res/comman/my_appbar.dart';
import '../../../res/comman/my_text.dart';
import '../widgets/order_history_card_widget.dart';

class MyCashBalanceScreen extends StatelessWidget {
  static const String routeName = '/myCashBalance';
  const MyCashBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBar(text: "My Cash Balance"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.045,
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
                        text: "Total Balance",
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
            // List of Orders
            MyTextSansPro(
              text: "Orders",
              fontSize: width * 0.06,
              color: AppColor.black,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: height * 0.01),
            Expanded(
              child: ListView.builder(
                itemCount: AppList.orders.length,
                itemBuilder: (context, index) {
                  final order = AppList.orders[index];

                  return OrderHistoryCard(
                    name: order.name,
                    orderId: order.orderNo,
                    date: order.date,
                    time: order.time,
                    earning: order.price,
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
