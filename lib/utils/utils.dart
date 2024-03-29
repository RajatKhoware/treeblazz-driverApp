import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tb_driver/data/models/order_model.dart';
import 'package:tb_driver/data/models/products.dart';
import 'package:tb_driver/utils/comman/my_text.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/constant/app_images.dart';
import 'package:tb_driver/utils/constant/app_list.dart';
import 'package:tb_driver/utils/constant/app_text.dart';
import 'package:tb_driver/utils/constant/enum.dart';

class Utils {
  // Private constructor
  Utils._();

  // Function to change the focus from the current textfield to another with keyboard
  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // Function to remove the splash effect when we click
  static ThemeData noSplashEffect(BuildContext context) {
    return Theme.of(context).copyWith(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  static String getCategoryString(ProductCategory category) {
    switch (category) {
      case ProductCategory.flower:
        return "Flowers";
      case ProductCategory.preroll:
        return "Preroll";
      case ProductCategory.bong:
        return "Bong";
      case ProductCategory.pipe:
        return "Pipe";
      case ProductCategory.vap:
        return "Vaporizer";
      case ProductCategory.grinders:
        return "Grinder";
      case ProductCategory.cartridges:
        return "Cartridges";
      case ProductCategory.edibles:
        return "Edibles";
      case ProductCategory.smoking:
        return "Smoking Accessories";
      default:
        return "Unknown";
    }
  }

  static String getFormattedDateSimple(int time) {
    DateFormat newFormat = DateFormat("MMMM dd, yyyy");
    return newFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
  }

  // Function taking paymentMode enum and returing it as a String
  static String getPaymentModeString(PaymentMode mode) {
    List<String> modes = [
      'Cash On Delivery',
      'VIA Credit Card',
      'VIA Debit Card',
      'Stripe',
    ];
    return modes[mode.index];
  }

  // Fuction take orderStatus enum and return  string
  static String getOrderStatusString(OrderStatus status) {
    List<String> orderStatus = [
      // "Placed",
      // "Cancelled",
      // "Accepted",
      // "Preparing",
      "News Orders",
      "Picked Up From Seller",
      "Out For Delivery",
      "Delivered",
    ];
    return orderStatus[status.index];
  }

  // Function generating 100 products
  static List<Product> generateDummyProducts() {
    List<Product> products = [];
    Random random = Random();

    // Function to generate a random product name based on category
    String generateProductName(ProductCategories category, Random random) {
      List<String> words = AppList.categoryWords[category]!;
      String prefix = words[random.nextInt(words.length)];
      String suffix = 'Product';
      return '$prefix $suffix';
    }

    for (int i = 0; i < 100; i++) {
      ProductCategories category = ProductCategories
          .values[random.nextInt(ProductCategories.values.length)];
      String productName = generateProductName(category, random);
      products.add(
        Product(
          id: 'P${i + 1}',
          name: productName,
          price: double.parse((random.nextDouble() * 100).toStringAsFixed(2)),
          description: 'Description of Product ${i + 1}',
          category: category,
          availableQuantity: random.nextInt(100),
          productVisibility: random.nextBool(),
          thumbnailImg: AppImages.organicCBDFlower,
          imgs: [AppImages.organicCBDFlower, AppImages.bong],
        ),
      );
    }

    return products;
  }

  // Fucntion generate 100 dummy orders
  static List<OrderModel> generateDummyOrders(List<Product> dummyProducts) {
    List<OrderModel> orders = [];
    Random random = Random();

    for (int i = 0; i < 100; i++) {
      List<Product> orderProducts = [];
      // Randomly choose between 1 to 5 products for each order
      int numberOfProducts = random.nextInt(5) + 1;
      for (int j = 0; j < numberOfProducts; j++) {
        Product product = dummyProducts[random.nextInt(dummyProducts.length)];
        orderProducts.add(product);
      }

      double subTotal =
          orderProducts.map((product) => product.price).reduce((a, b) => a + b);
      // Assuming 10% tax
      double tax = subTotal * 0.1;
      // Assuming fixed delivery charges
      double deliveryCharges = 5.0;
      // Random discount between 0 to 20%
      double discount = random.nextDouble() * 20;
      double total = subTotal + tax + deliveryCharges - discount;
      // Random time
      String time =
          '${random.nextInt(24).toString().padLeft(2, '0')}:${random.nextInt(60).toString().padLeft(2, '0')}';

      // Random Payment mode
      final paymentMode =
          PaymentMode.values[random.nextInt(PaymentMode.values.length)];
      orders.add(
        OrderModel(
          id: '${i + 1}',
          date: '2024-03-${random.nextInt(30) + 1}',
          time: time,
          paymentMode: paymentMode,
          products: orderProducts,
          status: OrderStatus.values[random.nextInt(OrderStatus.values.length)],
          storeName: "CBD VEG STORE",
          subTotal: double.parse(subTotal.toStringAsFixed(2)),
          tax: double.parse(tax.toStringAsFixed(2)),
          deliveryCharges: double.parse(deliveryCharges.toStringAsFixed(2)),
          discount: double.parse(discount.toStringAsFixed(2)),
          total: double.parse(total.toStringAsFixed(2)),
          deliveryAddress: 'Address of Order ${i + 1}',
          pickupAddress: "Address of Seller ${i + 1}",
        ),
      );
    }

    return orders;
  }

  // Checking the order status and on based of it its returing row
  static Row checkOrderStatus(OrderStatus status, double width) {
    Color statusColor = AppColor.statusColors[status] ?? Colors.grey;
    String statusText = AppText.statusTexts[status] ?? "Order Pending";

    return Row(
      children: [
        CircleAvatar(
          radius: width * 0.008,
          backgroundColor: statusColor,
        ),
        SizedBox(width: width * 0.01),
        MyTextPoppines(
          text: statusText,
          fontSize: width * 0.028,
          color: statusColor,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
