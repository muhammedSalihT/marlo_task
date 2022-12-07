import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/fa6_solid.dart';
import 'package:iconify_flutter/icons/fluent_emoji_high_contrast.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:marlo_task/app/constants/color_const.dart';
import 'package:marlo_task/app/features/global/controller/global_controller.dart';

class GlobalScreen extends GetWidget<GlobalScreenController> {
  const GlobalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return SafeArea(
          child: controller.screens[controller.selectedIndex.value]);
    }), bottomNavigationBar: Obx(() {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Iconify(
              color: controller.selectedIndex.value == 0 ? lightBlue : grey,
              Bx.home_alt,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Iconify(
              FluentEmojiHighContrast.money_bag,
              color: controller.selectedIndex.value == 1 ? lightBlue : grey,
            ),
            label: "Loans",
          ),
          BottomNavigationBarItem(
            icon: Iconify(
              Fa6Solid.file_invoice,
              color: controller.selectedIndex.value == 2 ? lightBlue : grey,
            ),
            label: "Contracts",
          ),
          BottomNavigationBarItem(
            icon: Iconify(
              Ph.users_three_light,
              color: controller.selectedIndex.value == 3 ? lightBlue : grey,
            ),
            label: "Teams",
          ),
          BottomNavigationBarItem(
            icon: Iconify(
              Uil.comment_question,
              color: controller.selectedIndex.value == 4 ? lightBlue : grey,
            ),
            label: "Chart",
          ),
        ],
        currentIndex: controller.selectedIndex.value,
        showUnselectedLabels: true,
        selectedItemColor: lightBlue,
        onTap: (index) {
          controller.onTapBottomNavButton(index);
        },
      );
    }));
  }
}
