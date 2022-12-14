import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marlo_task/app/constants/color_const.dart';
import 'package:marlo_task/app/features/contracts/controller/invite_people_controller.dart';
import 'package:marlo_task/app/theme/theme_controller.dart';
import 'package:marlo_task/app/utilities/text_style_widget.dart';

class EmailInputWidget extends GetWidget<InvitePeopleController> {
  const EmailInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: themeController.darkTheme.value ? lightSilver : skyBlue,
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyleWidget(
                  text: "Business Email",
                  textColor: silverColor,
                ),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    autofocus: true,
                    controller: controller.emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        controller.isValidEmail(value) ? null : "Invalid mail";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Enter email here",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
              ],
            )),
      );
    });
  }
}
