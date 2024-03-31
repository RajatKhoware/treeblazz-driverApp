import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_driver/data/models/order_model.dart';
import 'package:tb_driver/fetaures/dynamic/orders/controllers/order_controller.dart';
import 'package:tb_driver/utils/comman/app_snackbar.dart';
import 'package:tb_driver/utils/comman/my_button.dart';
import 'package:tb_driver/utils/comman/my_text.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/constant/enum.dart';

class RiderNavigationBottoSheet extends StatefulWidget {
  const RiderNavigationBottoSheet({super.key});

  @override
  State<RiderNavigationBottoSheet> createState() =>
      _RiderNavigationBottoSheetState();
}

class _RiderNavigationBottoSheetState extends State<RiderNavigationBottoSheet> {
  bool _bottomSheetVisible = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
    super.initState();
  }

  void _showBottomSheet() {
    setState(() {
      _bottomSheetVisible = true;
    });
  }

  void _toggleBottomSheet() {
    setState(() {
      _bottomSheetVisible = !_bottomSheetVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final orderController = OrderController.instance;
    final order = orderController.order.value;
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      width: width,
      height: _bottomSheetVisible ? height * 0.4 : height * 0.12,
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(width * 0.1),
          topRight: Radius.circular(width * 0.1),
        ),
        color: AppColor.white,
      ),
      child: Column(
        children: [
          // Button to Expand and Collaps sheet
          InkWell(
            onTap: _toggleBottomSheet,
            child: Container(
              width: width * 0.12,
              height: height * 0.006,
              margin: EdgeInsets.symmetric(vertical: height * 0.015),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColor.greyColor.withOpacity(0.4),
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildRowforTimeandDistance(
                context,
                order.status == OrderStatus.readyForPickup
                    ? "Store Name"
                    : "Buyer Name",
                "VEG STORE",
                Iconsax.shop_copy,
              ),
              buildRowforTimeandDistance(
                context,
                "Distance",
                "2.5 km",
                Iconsax.location_copy,
              ),
              buildRowforTimeandDistance(
                context,
                "Items",
                "2",
                Iconsax.box_copy,
              ),
            ],
          ),
          Divider(
            height: height * 0.05,
            color: AppColor.greyColor.withOpacity(0.2),
          ),
          // -- Location
          locationPreviewer(
            context: context,
            heading: "Your Location",
            location: "Pipewala Building, H Pasta Lane, Colaba",
          ),
          SizedBox(height: height * 0.04),
          locationPreviewer(
            context: context,
            heading: order.status == OrderStatus.readyForPickup
                ? "Store Location"
                : "Buyer Location",
            location: "Antila Building, H Pasta Lane, Bandra",
            isDriverLocation: false,
          ),

          SizedBox(height: height * 0.04),
          // -- BUTTONS Call/ Completed
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "Call",
                  onTap: () {
                    MySnackBar.showError(
                      title: "Calling ....",
                      message: "+91 78434-43240",
                    );
                  },
                ),
              ),
              SizedBox(width: width * 0.02),
              Expanded(
                child: CustomButton(
                  buttonColor: AppColor.green,
                  text: "Completed",
                  onTap: () {
                    order.status == OrderStatus.readyForPickup
                        ? orderController.orderPicked()
                        : orderController.orderDelivered();
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget locationPreviewer({
    required BuildContext context,
    required String heading,
    required String location,
    bool isDriverLocation = true,
  }) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        Icon(
          Icons.location_searching_sharp,
          color: isDriverLocation ? AppColor.redColor : AppColor.green,
          size: width * 0.06,
        ),
        SizedBox(width: width * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextPoppines(
              text: heading,
              fontSize: width * 0.03,
              color: AppColor.greyColor,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: height * 0.004),
            SizedBox(
              width: width * 0.7,
              child: MyTextPoppines(
                text: location,
                maxLines: 1,
                fontSize: width * 0.036,
                color: AppColor.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildRowforTimeandDistance(
    BuildContext context,
    String heading,
    String title,
    IconData icon,
  ) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        Icon(
          icon,
          color: AppColor.black,
          size: width * 0.058,
        ),
        SizedBox(width: width * 0.02),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextPoppines(
              text: heading,
              fontSize: width * 0.028,
              color: AppColor.greyColor,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: height * 0.004),
            MyTextPoppines(
              text: title,
              fontSize: width * 0.036,
              color: AppColor.black,
              fontWeight: FontWeight.w500,
            ),
          ],
        )
      ],
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double spaceWidth;
  final double strokeHeight;

  DashedBorderPainter({
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.dashWidth = 10.0,
    this.spaceWidth = 8.0,
    this.strokeHeight = 0.0, // Added strokeHeight with default value 0.0
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double totalHeight = 0.0;

    while (totalHeight < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, totalHeight),
        Offset(size.width / 2, totalHeight + dashWidth),
        paint,
      );
      totalHeight += dashWidth + spaceWidth;
      if (strokeHeight > 0.0) {
        canvas.drawLine(
          Offset(size.width / 2, totalHeight),
          Offset(size.width / 2, totalHeight + strokeHeight),
          paint,
        );
        totalHeight += strokeHeight + spaceWidth;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
