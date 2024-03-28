import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_driver/fetaures/dynamic/home/screens/home_screen.dart';
import 'package:tb_driver/fetaures/dynamic/orders/screens/orders_screen.dart';
import 'package:tb_driver/fetaures/dynamic/user%20profile/screen/profile_screen.dart';

class NavigationMenuController extends GetxController {
  final int? preferredIndex;
  NavigationMenuController({this.preferredIndex});

  static NavigationMenuController get instance => Get.find();

  // Variables
  Rx<int> selectedIndex = 0.obs;
  PageController pageController = PageController();
  // Screens
  List<Widget> pages = [
    const HomeScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: selectedIndex.value);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // Update the current page when Tapped
  void onItemTapped(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  // On Page Changed
  void onPageChanged(int index) {
    selectedIndex.value = index;
  }
}
