import 'package:akgsetu/screens/accept/accept-location.dart';
import 'package:akgsetu/screens/accept/inventory-consumed.dart';
import 'package:akgsetu/screens/auth/login.dart';
import 'package:akgsetu/screens/auth/otp_verify_screen.dart';
import 'package:akgsetu/screens/home/home.dart';
import 'package:get/get.dart';

import '../ui/screens/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
        name: Routes.root,
        page: () => SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.login,
        page: () => LoginPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.otpVerify,
        page: () => OtpVerifyScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.acceptLocation,
        page: () => AcceptLocation(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.home,
        page: () => HomePage(),
        transition: Transition.fadeIn),
          GetPage(
        name: Routes.inventoryConsumed,
        page: () => InventoryConsumed(),
        transition: Transition.fadeIn),
  ];
}
