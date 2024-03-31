import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_driver/data/models/order_model.dart';
import 'package:tb_driver/fetaures/dynamic/orders/controllers/order_controller.dart';
import 'package:tb_driver/fetaures/dynamic/orders/screens/order_details_screen.dart';
import 'package:tb_driver/utils/comman/my_text.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/constant/app_images.dart';
import 'package:tb_driver/utils/utils.dart';

class OrdersCard extends StatelessWidget {
  final VoidCallback? onTap;
  final OrderModel order;
  const OrdersCard({
    super.key,
    this.onTap,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap ??
          () {
            Get.to(() => OrderDetailsScreen(orders: order));
            OrderController.instance.getOrderDetails(order.id);
          },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: height * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.02),
          color: AppColor.containerGreyBg,
          border: Border.all(
            color: AppColor.containerGreyBorder,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Order Img
            Container(
              width: width * 0.3,
              height: height * 0.175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.02),
                image: const DecorationImage(
                  image: AssetImage(AppImages.organicCBDFlower),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Order Detailes
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.016),
                MyTextSansPro(
                  text: "Order #${order.id}",
                  fontSize: width * 0.045,
                  color: AppColor.black,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: height * 0.012),
                MyTextPoppines(
                  text: "\$ ${order.total}",
                  fontSize: width * 0.05,
                  color: AppColor.redColor,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: height * 0.012),
                Row(
                  children: [
                    Icon(
                      Iconsax.calendar_2_copy,
                      size: width * 0.04,
                      color: AppColor.redColor,
                    ),
                    SizedBox(width: width * 0.014),
                    MyTextPoppines(
                      text: order.date,
                      fontSize: width * 0.032,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(width: width * 0.06),
                    Icon(
                      Iconsax.clock_copy,
                      size: width * 0.04,
                      color: AppColor.redColor,
                    ),
                    SizedBox(width: width * 0.014),
                    MyTextPoppines(
                      text: order.time,
                      fontSize: width * 0.032,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.016),
                Utils.checkOrderStatus(order.status, width),
                // SizedBox(height: height * 0.016),
                // MyTextSansPro(
                //   text: Utils.getPaymentModeString(order.paymentMode),
                //   fontSize: width * 0.04,
                //   color: AppColor.greyColor,
                //   fontWeight: FontWeight.w500,
                // ),
                SizedBox(height: height * 0.016),
              ],
            ),
            // No of Products in order
            Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.005,
                horizontal: width * 0.03,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(width * 0.02),
                  topRight: Radius.circular(width * 0.02),
                ),
                color: AppColor.black,
              ),
              child: MyTextPoppines(
                text: order.products.length.toString(),
                color: AppColor.white,
                fontWeight: FontWeight.w600,
                fontSize: width * 0.035,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
