import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_driver/fetaures/dynamic/orders/controllers/order_controller.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/comman/my_text.dart';

import '../widget/home_appbar_widget.dart';
import '../widget/home_order_card_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.05,
          horizontal: width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppBar(),
            SizedBox(height: height * 0.04),
            MyTextSansPro(
              text: "New Orders",
              fontSize: width * 0.056,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: height * 0.01),
            const Expanded(
              child: HomeOrderCard(),
            )
          ],
        ),
      ),
    );
  }
}
