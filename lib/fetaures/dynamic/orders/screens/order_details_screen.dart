import 'package:flutter/material.dart';
import 'package:tb_driver/data/models/order.dart';
import 'package:tb_driver/fetaures/dynamic/orders/widgets/order_details_billing_card_widget.dart';
import 'package:tb_driver/fetaures/dynamic/orders/widgets/order_status_screen.dart';
import 'package:tb_driver/utils/comman/my_appbar.dart';
import 'package:tb_driver/utils/constant/enum.dart';
import 'package:tb_driver/utils/extensions/extensions.dart';

import '../../../../utils/constant/app_colors.dart';
import '../../../../utils/comman/my_button.dart';
import '../../../../utils/comman/my_text.dart';
import '../widgets/order_details_order_detaile_card_widget.dart';
import '../widgets/order_details_product_card_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  static const String routeName = '/orderDetails';
  const OrderDetailsScreen({super.key, required this.order});
  final Orders order;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: const MyAppBar(text: "Order Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.01,
            horizontal: width * 0.045,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // buildHeading(context, "Order Details"),
              // SizedBox(height: height * 0.02),
              OrderDetailsOrderCard(order: order),
              SizedBox(height: height * 0.02),
              // -- Delivery Details
              buildHeading(context, "Delivery Details"),
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
                      text: "Pickup Location",
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
                    SizedBox(height: height * 0.02),
                    MyTextSansPro(
                      text: "Delivery Location",
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
              // -- Order Products
              buildHeading(context, "Shopping Details"),
              SizedBox(height: height * 0.02),
              OrderDetailsProductsCard(order: order),
              SizedBox(height: height * 0.02),
              // -- Order Billing Details
              buildHeading(context, "Billing Details"),
              SizedBox(height: height * 0.02),
              OrderDetailsBillingCard(order: order),
              SizedBox(height: height * 0.02),
              // // -- Order Driver Details
              // buildHeading(context, "Driver Details"),
              // SizedBox(height: height * 0.02),
              // // -- Order Tracking Button
              // CustomButton(
              //   text: "Track Order",
              //   onTap: () {
              //     Navigator.of(context).pushScreen(
              //       OrderStatusScreen(
              //         orderStatus: order.status,
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: order.status == OrderStatus.readyForPickup,
        child: Padding(
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
      ),
    );
  }

  Widget buildHeading(BuildContext context, String text) {
    final width = MediaQuery.sizeOf(context).width;
    return MyTextSansPro(
      text: text,
      fontSize: width * 0.05,
      fontWeight: FontWeight.w600,
    );
  }
}
