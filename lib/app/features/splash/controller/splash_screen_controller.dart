import 'package:get/get.dart';
import 'package:marlo_task/app/features/global/view/global_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    getScreen();
    super.onInit();
  }

  Future<void> getScreen() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    Get.to(const GlobalScreen());
  }
}
