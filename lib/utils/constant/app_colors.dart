// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tb_driver/utils/constant/enum.dart';

class AppColor {
  //static const rColor = Color(0xFF);
  // static const greyColor = Color(0xFFA3A3A3);

  static const redColor = Color(0xFFC90921);
  static const greyColor = Color(0xFFA3A3A3);
  static const lightBlue = Color(0xFFF2F5F9);
  static const lightBlueBg = Color(0xFFF7F9FC);
  static const darkBlue = Color(0xFF0F3167);
  static const lightPink = Color(0xFFFBECEE);
  static const white = Color(0xFFFFFFFF);
  static const black = Colors.black;
  static const golden = Color(0xFFFF8C00);
  static const scaffoldBg = Color(0xFFF7F9FC);
  static const green = Color(0xFF29AE61);

  // background
  static const containerGreyBg = Color(0xFFF8F8F8);

  // Text colors
  static const textDarkBlue = Color(0xFF596F79);

  // Border color
  static final containerGreyBorder = greyColor.withOpacity(0.3);

  // State colors
  static const Color warningColor = Color(0xFFFFD700); // Yellow
  static const Color errorColor = Color(0xFFB00020); // Red
  static const Color successColor = Color(0xFF008000); // Green

  // Home dashboard container colors
  static const hd_lightPink = Color(0xFFF9E6E8);
  static const hd_lightBlue = Color(0xFFDDF5FE);
  static const hd_cream = Color(0xFFFFF2DC);
  static const hd_lightGreen = Color(0xFFD4FFDF);
  static const hd_lightPurple = Color(0xFFF2D9FA);
  static const hd_greyColor = Color(0xFF586E78);
  //static const hd_light = Color(0xFF);

  static Map<OrderStatus, Color> statusColors = {
    // OrderStatus.placed: black,
    // OrderStatus.accept: Colors.blueAccent,
    // OrderStatus.cancelled: redColor,
    // OrderStatus.preparing: golden,
    OrderStatus.readyForPickup: Colors.purple,
    OrderStatus.pickedUpByDriver: darkBlue,
    OrderStatus.outForDelivery: Colors.teal,
    OrderStatus.delivered: green,
  };
}
