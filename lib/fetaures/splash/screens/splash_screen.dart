import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tb_driver/fetaures/splash/screens/splash_screen_01.dart';
import 'package:tb_driver/fetaures/splash/screens/splash_screen_02.dart';
import 'package:tb_driver/fetaures/splash/screens/splash_screen_03.dart';
import 'package:tb_driver/res/comman/app_colors.dart';

import '../../../res/comman/my_text.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: screens.length,
      initialIndex: index,
      vsync: this,
    );

    // Add a listener to the tab controller to update the index when the user slides
    _tabController.addListener(() {
      setState(() {
        index = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          TabBarView(
            controller: _tabController,
            children: screens,
          ),
          Positioned(
            bottom: height * 0.05,
            child: index == 0
                ? const SizedBox()
                : buildIndicator(
                    (val) {
                      setState(() {
                        index = val;
                        _tabController.animateTo(index);
                      });
                    },
                  ),
          ),
          Positioned(
            top: 50,
            right: 10,
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, "/signin"),
              child: MyTextPoppines(
                text: index != 2 ? "Skip" : "Next",
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  //Dot indicator
  Widget buildIndicator(Function(int)? onTap) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return AnimatedSmoothIndicator(
      activeIndex: index,
      count: 3,
      onDotClicked: onTap,
      effect: ExpandingDotsEffect(
        dotHeight: height * 0.012,
        dotWidth: width * 0.05,
        dotColor: Colors.grey.shade300,
        activeDotColor: AppColor.redColor,
        spacing: width * 0.02,
      ),
    );
  }
}

List<Widget> screens = const [
  SplashScreen01(),
  SplashScreen02(),
  SplashScreen03()
];
