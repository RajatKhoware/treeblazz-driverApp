import 'package:flutter/material.dart';
import 'package:tb_driver/utils/comman/my_appbar.dart';
import 'package:tb_driver/utils/comman/my_button.dart';
import 'package:tb_driver/utils/comman/my_text.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/constant/enum.dart';

class OrderStatusScreen extends StatelessWidget {
  final OrderStatus? orderStatus;
  static const String routeName = '/orderStatus';
  const OrderStatusScreen({
    super.key,
    this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: const MyAppBar(text: "Order Status"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyTextSansPro(
              text: "Ordered Date",
              fontSize: width * 0.038,
              fontWeight: FontWeight.w600,
              color: AppColor.black.withOpacity(0.7),
            ),
            SizedBox(height: height * 0.008),
            MyTextPoppines(
              text: "28 Mar, 2024 / 9.30 PM",
              fontSize: width * 0.045,
              fontWeight: FontWeight.w600,
              color: AppColor.black,
            ),
            SizedBox(height: height * 0.035),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.03),
                border: Border.all(color: AppColor.greyColor.withOpacity(0.2)),
                color: const Color(0xFFFBFBFB),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextSansPro(
                          text: "Order Id",
                          fontSize: width * 0.038,
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                        MyTextSansPro(
                          text: "BFCSXV",
                          fontSize: width * 0.038,
                          fontWeight: FontWeight.w600,
                          color: AppColor.greyColor,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: height * 0.04,
                    color: AppColor.greyColor.withOpacity(0.2),
                  ),

                  //! Remove for app
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  //   child: OrderTracker(
                  //     status: orderStatus,
                  //     activeColor: AppColor.redColor,
                  //     inActiveColor: AppColor.greyColor.withOpacity(0.6),
                  //     subDateTextStyle: TextStyle(
                  //       color: AppColor.greyColor,
                  //       fontSize: width * 0.03,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: height * 0.02),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.062,
          vertical: height * 0.02,
        ),
        child: SizedBox(
          height: height * 0.07,
          child: CustomButton(
            text: "Back",
            onTap: () => Navigator.of(context).pop(),
            vspacing: height * 0.02,
            fontSize: width * 0.05,
          ),
        ),
      ),
    );
  }
}
