import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marlo_task/app/features/home/controller/home_screen_conmtroller.dart';
import 'package:marlo_task/app/theme/theme_controller.dart';

class HomeScree extends GetWidget<HomeScreeController> {
  HomeScree({Key? key}) : super(key: key);

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          themeController.selectTheme();
        }, child: Obx(() {
          return Text(
              themeController.darkTheme.value ? "LightTheme" : "DarkTheme");
        })),
      ),
    );
  }
}
