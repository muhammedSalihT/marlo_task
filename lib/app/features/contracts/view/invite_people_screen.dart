import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marlo_task/app/constants/color_const.dart';
import 'package:marlo_task/app/constants/space_box.dart';
import 'package:marlo_task/app/features/contracts/controller/invite_people_controller.dart';
import 'package:marlo_task/app/features/contracts/view/widgets/refracted_textfield.dart';
import 'package:marlo_task/app/features/contracts/view/widgets/show_roles_widget.dart';
import 'package:marlo_task/app/theme/theme_controller.dart';
import 'package:marlo_task/app/utilities/text_style_widget.dart';

class InvitePeopleScreen extends GetWidget<InvitePeopleController> {
  const InvitePeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              onPressed: () {
                controller.disposeWidget();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                stdHeightBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextStyleWidget(
                      text: "Invite",
                      textSize: 40,
                      textWidth: FontWeight.bold,
                    ),
                    mediumHeightBox,
                    const EmailInputWidget(),
                    stdHeightBox,
                    GestureDetector(
                      onTap: () {
                        showRolesWidget(context);
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: themeController.darkTheme.value
                                ? lightSilver
                                : skyBlue),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GetBuilder<InvitePeopleController>(
                                    builder: (controller) {
                                  return TextStyleWidget(
                                    text: controller.invitingRole,
                                    textSize: 18,
                                  );
                                }),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: lightBlue,
                                )
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            GetBuilder<InvitePeopleController>(builder: (controller) {
          return controller.netCheck
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: CupertinoActivityIndicator(
                    color: lightBlue,
                    radius: 20,
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all((lightBlue))),
                        onPressed: () async {
                          String result =
                              await controller.inviteButtonPressed();
                          if (result == "SUCCESS") {
                            Get.back();
                          }
                        },
                        child: const Text(
                          "Continue",
                        ),
                      ),
                    ),
                  ),
                );
        }),
      );
    });
  }
}
