import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool darkTheme = false.obs;

  selectTheme() {
    darkTheme.value = !darkTheme.value;
  }
}
