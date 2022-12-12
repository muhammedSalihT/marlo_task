import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marlo_task/app/constants/color_const.dart';
import 'package:marlo_task/app/constants/space_box.dart';
import 'package:marlo_task/app/features/contracts/controller/invite_people_controller.dart';
import 'package:marlo_task/app/theme/theme_controller.dart';
import 'package:marlo_task/app/utilities/text_style_widget.dart';

Future<dynamic> showRolesWidget(
  BuildContext context,
) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    ),
    context: context,
    builder: (BuildContext ctx) {
      return GetBuilder<ThemeController>(builder: (themeController) {
        return SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  stdHeightBox,
                  Center(
                    child: ColoredBox(
                      color: skyBlue,
                      child: const SizedBox(
                        height: 3,
                        width: 50,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: TextStyleWidget(
                      text: "Team Roles",
                      textSize: 25,
                      textWidth: FontWeight.w600,
                    ),
                  ),
                  mediumHeightBox,
                  GetBuilder<InvitePeopleController>(
                    builder: (controller) {
                      return ListView.separated(
                        separatorBuilder: (context, index) {
                          return stdHeightBox;
                        },
                        shrinkWrap: true,
                        itemCount: controller.roles.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.roleSelected(index);
                              Get.back();
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: controller.invitingRole ==
                                        controller.roles[index]
                                    ? skyBlue
                                    : themeController.darkTheme.value
                                        ? lightGrey
                                        : white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextStyleWidget(
                                      textSize: 18,
                                      textColor: controller.invitingRole ==
                                              controller.roles[index]
                                          ? lightBlue
                                          : silverColor,
                                      text: controller.roles[index].toString(),
                                    )),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      });
    },
  );
}
