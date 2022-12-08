import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marlo_task/app/constants/color_const.dart';
import 'package:marlo_task/app/constants/space_box.dart';
import 'package:marlo_task/app/features/contracts/controller/invite_people_controller.dart';
import 'package:marlo_task/app/features/contracts/view/widgets/refracted_textfield.dart';
import 'package:marlo_task/app/theme/theme_controller.dart';
import 'package:marlo_task/app/utilities/text_style_widget.dart';

class InvitePeopleScreen extends GetWidget<InvitePeopleController> {
  InvitePeopleScreen({Key? key}) : super(key: key);

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 20,
          splashColor: dark,
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: themeController.darkTheme.value ? white : dark,
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
                  TextStyleWidget(
                    text: "Invite",
                    textColor: themeController.darkTheme.value ? white : dark,
                    textSize: 40,
                  ),
                  mediumHeightBox,
                  TextformFieldWidget(),
                  stdHeightBox,
                  GetBuilder<InvitePeopleController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          context: context,
                          builder: (BuildContext ctx) {
                            return ColoredBox(
                              color: themeController.darkTheme.value
                                  ? dark
                                  : white,
                              child: SizedBox(
                                height: 400,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        stdHeightBox,
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 170),
                                          child: Divider(
                                            color:
                                                themeController.darkTheme.value
                                                    ? dark
                                                    : lightBlue,
                                            thickness: 4,
                                          ),
                                        ),
                                        TextStyleWidget(
                                          text: "Team Roles",
                                          textColor:
                                              themeController.darkTheme.value
                                                  ? white
                                                  : dark,
                                          textSize: 25,
                                          textWidth: FontWeight.w700,
                                        ),
                                        mediumHeightBox,
                                        ListView.separated(
                                            separatorBuilder: (context, index) {
                                              return stdHeightBox;
                                            },
                                            shrinkWrap: true,
                                            itemCount: controller.roles.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .roleSelected(index);
                                                  Get.back();
                                                },
                                                child: GetBuilder<
                                                        InvitePeopleController>(
                                                    builder: (controller) {
                                                  return Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: controller
                                                                  .invitingRole ==
                                                              controller
                                                                  .roles[index]
                                                          ? skyBlue
                                                          : themeController
                                                                  .darkTheme
                                                                  .value
                                                              ? lightGrey
                                                              : white,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child:
                                                              TextStyleWidget(
                                                            textSize: 18,
                                                            textColor: controller
                                                                        .invitingRole ==
                                                                    controller
                                                                            .roles[
                                                                        index]
                                                                ? darkBlue
                                                                : themeController
                                                                        .darkTheme
                                                                        .value
                                                                    ? white
                                                                    : dark,
                                                            text: controller
                                                                .roles[index]
                                                                .toString(),
                                                          )),
                                                    ),
                                                  );
                                                }),
                                              );
                                            }),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: themeController.darkTheme.value
                                ? lightGrey
                                : white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextStyleWidget(
                                  text: controller.invitingRole,
                                  textColor: themeController.darkTheme.value
                                      ? white
                                      : dark,
                                  textSize: 18,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: themeController.darkTheme.value
                                      ? white
                                      : dark,
                                )
                              ]),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.transparent),
          width: 500,
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(10),
            ),
            onPressed: () {
              controller.inviteButtonPressed();
            },
            child: const Text(
              "Continue",
            ),
          ),
        ),
      ),
    );
  }
}
