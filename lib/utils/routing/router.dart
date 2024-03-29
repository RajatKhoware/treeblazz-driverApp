import 'package:flutter/material.dart';
import 'package:tb_driver/fetaures/static/bottom%20bar/view/app_bottomBar.dart';
import 'package:tb_driver/fetaures/static/faq/screens/faq_screen.dart';
import 'package:tb_driver/fetaures/dynamic/auth/screen/signin_screen.dart';
import 'package:tb_driver/fetaures/dynamic/auth/screen/signup_screen.dart';
import 'package:tb_driver/fetaures/dynamic/checkout/screens/checkout_screen.dart';
import 'package:tb_driver/fetaures/dynamic/user%20profile/screen/edit_profile_screen.dart';
import 'package:tb_driver/fetaures/dynamic/home/screens/home_screen.dart';
import 'package:tb_driver/fetaures/dynamic/my%20cash%20balance/screens/my_cash_balance_screen.dart';
import 'package:tb_driver/fetaures/dynamic/my%20earnings/screens/my_earnings_screen.dart';
import 'package:tb_driver/fetaures/dynamic/notification/screen/notification_screen.dart';
import 'package:tb_driver/fetaures/dynamic/edit%20password/screen/change_password_screen.dart';
import 'package:tb_driver/fetaures/dynamic/rider_navigation/screens/rider_navigation_screen.dart';
import 'package:tb_driver/fetaures/static/splash/screens/splash_screen.dart';
import 'package:tb_driver/fetaures/dynamic/support/screens/support_screen.dart';

import '../comman/my_text.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignInScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignInScreen(),
      );
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpScreen(),
      );
    // case SplashScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const SplashScreen(),
    //   );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    // case AppBottomBar.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const AppBottomBar(),
    //   );
    case EditProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EditProfileScreen(),
      );
    case ChangePasswordScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ChangePasswordScreen(),
      );
    case CheckoutScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CheckoutScreen(),
      );
    case NotificationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NotificationScreen(),
      );
    // case RiderNavigationScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const RiderNavigationScreen(),
    //   );
    case MyEarningScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MyEarningScreen(),
      );
    case MyCashBalanceScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MyCashBalanceScreen(),
      );
    case FAQScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => FAQScreen(),
      );
    case SupportScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SupportScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: MyTextPoppines(text: "No routes defined"),
          ),
        ),
      );
  }
}
