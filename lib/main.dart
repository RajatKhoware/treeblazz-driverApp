import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tb_driver/controllers/network_controller.dart';
import 'package:tb_driver/data/repositories/auth_repository.dart';
import 'package:tb_driver/fetaures/dynamic/orders/controllers/order_controller.dart';
import 'package:tb_driver/fetaures/static/bottom%20bar/view/app_bottomBar.dart';
import 'package:tb_driver/fetaures/static/navigation%20menu/view/app_navigation_menu.dart';
import 'package:tb_driver/fetaures/static/splash/screens/splash_screen.dart';
import 'package:tb_driver/firebase_options.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';

import 'utils/routing/router.dart';

void main() async {
  /// -- Widget binding
  WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storage
  await GetStorage.init();

  /// -- Initialize Firebase & Autheantication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthRepository()),
  );

  /// -- Our App Starts From Here.
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
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'TB Driver',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.white,
      ),
      home: const SplashScreen(),
      // home: const Scaffold(
      //   backgroundColor: AppColor.white,
      //   body: Center(
      //     child: CircularProgressIndicator(
      //       color: AppColor.redColor,
      //     ),
      //   ),
      // ),
      navigatorKey: navigatorKey,
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(OrderController());
  }
}
