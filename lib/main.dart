import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marlo_task/app/features/splash/view/splash_screen.dart';
import 'package:marlo_task/app/theme/theme_controller.dart';
import 'package:marlo_task/app/theme/theme_style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.themeData(_themeController.darkTheme, context),
        home: SplashScreen(),
      );
    });
  }
}
