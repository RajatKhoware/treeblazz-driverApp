import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tb_driver/fetaures/dynamic/orders/controllers/order_controller.dart';
import 'package:tb_driver/fetaures/dynamic/orders/screens/order_details_screen.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/constant/app_images.dart';
import 'package:tb_driver/utils/comman/my_button.dart';
import 'package:tb_driver/utils/comman/my_text.dart';
import 'package:tb_driver/utils/constant/enum.dart';
import 'package:tb_driver/utils/extensions/extensions.dart';

class HomeOrderCard extends StatelessWidget {
  const HomeOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final orderController = OrderController.instance;
    final newOrders = orderController.filteredOrders
        .where((order) => order.status == OrderStatus.readyForPickup)
        .toList();
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: newOrders.length,
      itemBuilder: (context, index) {
        final order = newOrders[index];
        return Container(
          width: width,
          padding: EdgeInsets.symmetric(
            vertical: height * 0.015,
            horizontal: width * 0.035,
          ),
          margin: EdgeInsets.symmetric(vertical: height * 0.015),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.015),
            border: Border.all(
              color: AppColor.greyColor.withOpacity(0.4),
            ),
          ),
          child: Column(
            children: [
              // Img + Name + Order Date + Order Time
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.22,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.02),
                      color: AppColor.black,
                      image: const DecorationImage(
                        image: AssetImage(AppImages.man),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextSansPro(
                        text: "Taelyann Thorpe",
                        fontSize: width * 0.048,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildTimeNDate(context, Icons.date_range, order.date),
                          SizedBox(width: width * 0.05),
                          buildTimeNDate(
                              context, CupertinoIcons.clock, order.time),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: height * 0.025),
              // Order No + Delivery + Cost + Payment
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildOrderDetails(
                    context,
                    "Order no.",
                    order.id,
                  ),
                  buildOrderDetails(
                    context,
                    "Delivery",
                    "30 Min",
                  ),
                  buildOrderDetails(
                    context,
                    "Cost",
                    "\$ ${order.deliveryCharges}",
                  ),
                  buildOrderDetails(
                    context,
                    "Payment",
                    "COD",
                  ),
                ],
              ),

              // Cancell + Accept Order Button
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Cancel",
                      buttonColor: AppColor.black,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: width * 0.04),
                  Expanded(
                    child: CustomButton(
                      text: "Accept Order",
                      // onTap: () {},
                      onTap: () =>
                          Get.to(() => OrderDetailsScreen(order: order)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
            ],
          ),
        );
      },
    );
  }

  Widget buildTimeNDate(
    BuildContext context,
    IconData icon,
    String text,
  ) {
    final width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        Icon(
          icon,
          color: AppColor.redColor,
          size: width * 0.045,
        ),
        SizedBox(width: width * 0.015),
        MyTextPoppines(
          text: text,
          fontSize: width * 0.033,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }

  Widget buildOrderDetails(
    BuildContext context,
    String heading,
    String detaile,
  ) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextSansPro(
          text: heading,
          fontSize: width * 0.038,
          color: AppColor.black.withOpacity(0.7),
          fontWeight: FontWeight.w500,
        ),
        MyTextPoppines(
          text: detaile,
          fontSize: width * 0.038,
          color: AppColor.black,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
