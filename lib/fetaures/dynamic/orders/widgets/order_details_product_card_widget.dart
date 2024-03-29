import 'package:flutter/material.dart';
import 'package:tb_driver/data/models/order_model.dart';
import 'package:tb_driver/utils/comman/my_text.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/constant/app_images.dart';

class OrderDetailsProductsCard extends StatelessWidget {
  final OrderModel order;

  const OrderDetailsProductsCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final productLength = order.products.length;
    final productHeight = height * (productLength * 0.18);
    return SizedBox(
      width: width,
      height: productHeight,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productLength,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: height * 0.005,
            ),
            padding: EdgeInsets.symmetric(vertical: height * 0.004),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.greyColor.withOpacity(0.4),
              ),
              borderRadius: BorderRadius.circular(width * 0.02),
            ),
            child: Row(
              children: [
                // Product Img
                SizedBox(
                  width: width * 0.3,
                  child: Image.asset(
                    AppImages.organicCBDFlower,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(width: width * 0.07),
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextSansPro(
                        text: "Flowers",
                        fontSize: width * 0.036,
                        fontWeight: FontWeight.w600,
                        color: AppColor.redColor,
                      ),
                      SizedBox(height: height * 0.01),
                      SizedBox(
                        width: width * 0.4,
                        child: MyTextSansPro(
                          text: "Organic CBD Flower Cured with Terpenes",
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(height: height * 0.018),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
