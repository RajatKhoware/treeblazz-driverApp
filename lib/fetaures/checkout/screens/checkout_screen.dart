import 'package:flutter/material.dart';
import 'package:tb_driver/fetaures/checkout/widgets/checkout_billing_card_widget.dart';
import 'package:tb_driver/res/comman/my_appbar.dart';
import 'package:tb_driver/utils/extensions/extensions.dart';

import '../../../res/comman/app_colors.dart';
import '../../../res/comman/my_redbutton.dart';
import '../../../res/comman/my_text.dart';
import '../widgets/checkout_order_detaile_card_widget.dart';
import '../widgets/checkout_product_card_widget.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: const MyAppBar(text: "Checkout"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.01,
            horizontal: width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextSansPro(
                text: "Delivery Address",
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.02),
              Container(
                width: width,
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.019,
                  horizontal: width * 0.035,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.015),
                  border: Border.all(
                    color: AppColor.greyColor.withOpacity(0.4),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextSansPro(
                      text: "Home",
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: height * 0.008),
                    MyTextSansPro(
                      text: "Amber Person (+98304934)",
                      fontSize: width * 0.036,
                      color: AppColor.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: height * 0.005),
                    MyTextSansPro(
                      text: "78th Street 88 W 21st St,NY",
                      fontSize: width * 0.036,
                      color: AppColor.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              MyTextSansPro(
                text: "Shopping List",
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.02),
              const CheckoutProductCard(),
              SizedBox(height: height * 0.02),
              MyTextSansPro(
                text: "Billing Details",
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.02),
              const CheckoutBillingCard(),
              SizedBox(height: height * 0.02),
              MyTextSansPro(
                text: "Order Details",
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.02),
              const CheckoutOrderDetailsCard()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.062,
          vertical: height * 0.02,
        ),
        child: SizedBox(
          height: height * 0.075,
          child: CustomButton(
            text: "Accept Order",
            onTap: () => context.pushNamedRoute("/riderNavigation"),
            vspacing: height * 0.02,
            fontSize: width * 0.043,
          ),
        ),
      ),
    );
  }
}
