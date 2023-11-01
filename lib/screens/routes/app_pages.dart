
import 'package:akgsetu/screens/auth/login.dart';
import 'package:get/get.dart';

import '../ui/screens/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
        name: Routes.root,
        page: () => SplashScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: Routes.login,
        page: () => LoginPage(),
        transition: Transition.rightToLeft),

  ];
}
