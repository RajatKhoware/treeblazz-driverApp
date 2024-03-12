import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tb_driver/fetaures/my%20cash%20balance/screens/my_cash_balance_screen.dart';
import 'package:tb_driver/fetaures/my%20earnings/screens/my_earnings_screen.dart';
import 'package:tb_driver/fetaures/notification/screen/notification_screen.dart';
import 'package:tb_driver/fetaures/rider_navigation/screens/rider_navigation_screen.dart';
import 'package:tb_driver/res/comman/app_buttomBar.dart';

import 'fetaures/splash/screens/splash_screen.dart';
import 'res/routing/router.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (BuildContext context) => const MyApp(),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Tree_Blazz Driver',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppBottomBar(),
      navigatorKey: navigatorKey,
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
