import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tb_driver/fetaures/home/screens/home_screen.dart';
import 'package:tb_driver/res/comman/app_colors.dart';

import '../../fetaures/profile/screens/profile_screen.dart';

class AppBottomBar extends StatefulWidget {
  final int? selectedIndex;
  static const String routeName = '/bottomBar';
  const AppBottomBar({super.key, this.selectedIndex});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  late int _selectedIndex;
  PageController _pageController = PageController();
  @override
  void initState() {
    _selectedIndex = widget.selectedIndex ?? 0;
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  List<Widget> pages = [
    const HomeScreen(),
    const ProfileScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: pages,
      ),
      // bottomNavigationBar: NavigationBar(
      //   backgroundColor: AppColor.white,
      //   selectedIndex: _selectedIndex,
      //   onDestinationSelected: _onItemTapped,
      //   overlayColor: MaterialStatePropertyAll(Colors.transparent),
      //   destinations: [
      //     NavigationDestination(
      //       icon: Icon(
      //         CupertinoIcons.home,
      //         color: _getColor(0),
      //       ),
      //       label: 'Home',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(
      //         CupertinoIcons.home,
      //         color: _getColor(1),
      //       ),
      //       label: 'Order',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(
      //         CupertinoIcons.person,
      //         color: _getColor(2),
      //       ),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 25,
        backgroundColor: AppColor.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: _getColor(0),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt,
              color: _getColor(1),
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
              color: _getColor(2),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // Ensure labels are always displayed
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        selectedItemColor: Colors.black,
        selectedFontSize: width * 0.035,
        selectedIconTheme: IconThemeData(size: width * 0.075),
        unselectedItemColor: AppColor.greyColor,
        unselectedFontSize: width * 0.035,
        unselectedIconTheme: IconThemeData(size: width * 0.075),
      ),
    );
  }

  Color _getColor(int index) {
    return _selectedIndex == index ? AppColor.redColor : AppColor.greyColor;
  }
}
