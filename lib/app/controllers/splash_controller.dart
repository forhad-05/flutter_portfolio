import 'package:get/get.dart';
import '../routes/app_routes.dart';

class SplashController extends GetxController {
  final RxDouble opacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _startAnimationAndNavigate();
  }

  void _startAnimationAndNavigate() async {
    await Future.delayed(const Duration(milliseconds: 200));
    opacity.value = 1.0;
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(Routes.MAIN);
  }
}
