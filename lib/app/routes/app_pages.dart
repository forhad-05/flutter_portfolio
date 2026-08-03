import 'package:get/get.dart';
import '../bindings/splash_binding.dart';
import '../bindings/home_binding.dart';
import '../views/splash_view.dart';
import '../views/main_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => const MainView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
