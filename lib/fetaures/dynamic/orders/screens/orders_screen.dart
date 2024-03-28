import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_driver/fetaures/dynamic/orders/controllers/order_controller.dart';
import 'package:tb_driver/fetaures/dynamic/orders/widgets/filter_order_button.dart';
import 'package:tb_driver/fetaures/dynamic/orders/widgets/order_card.dart';
import 'package:tb_driver/utils/comman/my_appbar.dart';
import 'package:tb_driver/utils/comman/serach_textfield.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/order';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = OrderController.instance;
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: const MyAppBarWithoutButton(text: "Orders"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.045,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: SearchTextFeild(controller: controller)),
                SizedBox(width: width * 0.03),
                const FilterOrderButton(),
              ],
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: RefreshIndicator(
                color: Colors.black,
                backgroundColor: AppColor.lightPink,
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1));
                  orderController.refreshOrders();
                },
                child: Obx(
                  () => ListView.builder(
                    itemCount: orderController.filteredOrders.length,
                    itemBuilder: (context, index) {
                      final orders = orderController.filteredOrders;
                      final order = orders[index];
                      return OrdersCard(order: order);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
