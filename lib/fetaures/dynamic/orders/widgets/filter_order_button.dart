import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_driver/fetaures/dynamic/orders/controllers/order_controller.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/constant/enum.dart';
import 'package:tb_driver/utils/utils.dart';

class FilterOrderButton extends StatelessWidget {
  const FilterOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final orderController = OrderController.instance;
    return PopupMenuButton(
      icon: CircleAvatar(
        radius: width * 0.06,
        backgroundColor: const Color.fromARGB(255, 244, 245, 247),
        child: const Icon(
          Iconsax.filter,
          color: AppColor.redColor,
        ),
      ),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          const PopupMenuItem(
            value: "all",
            child: Text("All Orders"),
          ),
          for (var status in OrderStatus.values)
            PopupMenuItem(
              value: status,
              child: Text(Utils.getOrderStatusString(status)),
            ),
        ];
      },
      onSelected: (value) {
        if (value == 'all') {
          orderController.clearFilter();
        } else {
          orderController.filterOrders(value as OrderStatus);
        }
      },
    );
  }
}
