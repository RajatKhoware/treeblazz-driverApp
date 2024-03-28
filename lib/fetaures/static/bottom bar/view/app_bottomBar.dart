import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_driver/fetaures/static/bottom%20bar/controller/bottom_bar_controller.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import '../../../../utils/utils.dart';

class AppBottomBar extends StatelessWidget {
  static const String routeName = '/bottomBar';
  final int? selectedIndex;
  const AppBottomBar({
    super.key,
    this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final controller = Get.put(
      BottomBarController(preferredIndex: selectedIndex ?? 0),
    );

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(), // Disable swiping
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: controller.pages,
      ),
      bottomNavigationBar: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.008,
            horizontal: width * 0.01,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor.greyColor.withOpacity(0.6),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            color: AppColor.white,
          ),
          child: Theme(
            data: Utils.noSplashEffect(context),
            child: BottomNavigationBar(
              elevation: 0.0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: AppColor.white,
                  icon: Icon(
                    Iconsax.home_copy,
                    color: _getColor(0, controller.selectedIndex.value),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColor.white,
                  icon: Icon(
                    Iconsax.receipt_1_copy,
                    color: _getColor(1, controller.selectedIndex.value),
                  ),
                  label: 'Order',
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColor.white,
                  icon: Icon(
                    Iconsax.user_copy,
                    color: _getColor(2, controller.selectedIndex.value),
                  ),
                  label: 'Profile',
                ),
              ],
              currentIndex: controller.selectedIndex.value,
              onTap: controller.onItemTapped,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
              selectedItemColor: Colors.black,
              selectedFontSize: width * 0.035,
              selectedIconTheme: IconThemeData(size: width * 0.06),
              unselectedItemColor: AppColor.greyColor,
              unselectedFontSize: width * 0.035,
              unselectedIconTheme: IconThemeData(size: width * 0.065),
            ),
          ),
        ),
      ),
    );
  }

  Color _getColor(int index, int selectedVal) {
    return selectedVal == index ? AppColor.redColor : AppColor.greyColor;
  }
}
