import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marlo_task/app/features/contracts/controller/contracts_screen_controller.dart';
import 'package:marlo_task/app/features/global/controller/global_controller.dart';
import 'package:marlo_task/app/features/splash/controller/splash_screen_controller.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());
  final globalController = Get.put(GlobalScreenController());
  final contractsScreenController = Get.put(ContractsScreenController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Marlo_Task")),
    );
  }
}
