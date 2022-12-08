import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marlo_task/app/constants/color_const.dart';
import 'package:marlo_task/app/constants/space_box.dart';
import 'package:marlo_task/app/features/contracts/controller/contracts_screen_controller.dart';
import 'package:marlo_task/app/features/contracts/view/invite_people_screen.dart';
import 'package:marlo_task/app/theme/theme_controller.dart';
import 'package:marlo_task/app/utilities/text_style_widget.dart';

class ContractsScreen extends GetWidget<ContractsScreenController> {
  ContractsScreen({Key? key}) : super(key: key);

  final themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: TextStyleWidget(
            text: "Teams",
            textColor: themeController.darkTheme.value ? white : dark,
            textSize: 50,
          ),
          actions: [
            Icon(
              Icons.search,
              color: grey,
              size: 40,
            )
          ],
        ),
        body: GetBuilder<ContractsScreenController>(
            builder: (contractsScreenController) {
          return Column(
            children: [
              k40Height,
              HeadingWidgets(
                head:
                    "All People • ${contractsScreenController.peopleList[0].data!.contacts!.length}",
              ),
              ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 30),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data = contractsScreenController
                      .peopleList[0].data!.contacts![index];
                  return Container(
                    decoration: BoxDecoration(
                        color:
                            themeController.darkTheme.value ? lightGrey : white,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            color: darkBlue,
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        width: 50,
                        child: Center(
                          child: TextStyleWidget(
                              textColor: white,
                              textWidth: FontWeight.w600,
                              text:
                                  " ${data.firstname[0].toUpperCase()} ${data.lastname[0].toUpperCase()}"),
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextStyleWidget(
                              textColor: themeController.darkTheme.value
                                  ? white
                                  : dark,
                              text:
                                  "${data.firstname.toUpperCase()} ${data.lastname.toUpperCase()}"),
                          const TextStyleWidget(text: "Admin")
                        ],
                      ),
                      subtitle: TextStyleWidget(
                          textColor: grey,
                          text: data.isactive == true ? "Active" : "Inactive"),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return stdHeightBox;
                },
                itemCount: 2,
              ),
              stdHeightBox,
              HeadingWidgets(
                head:
                    "Invited People • ${contractsScreenController.peopleList[0].data!.invites!.length}",
              ),
              ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 30),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final invitiesData = contractsScreenController
                      .peopleList[0].data!.invites![index];
                  return Container(
                    decoration: BoxDecoration(
                        color:
                            themeController.darkTheme.value ? lightGrey : white,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              color: darkCream,
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          width: 50,
                          child: Center(
                            child: TextStyleWidget(
                                textColor: white,
                                textWidth: FontWeight.w600,
                                text:
                                    " ${invitiesData.email![0].toUpperCase()}"),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextStyleWidget(
                                text: "${invitiesData.email}",
                                textColor: themeController.darkTheme.value
                                    ? white
                                    : dark),
                          ],
                        ),
                        subtitle: TextStyleWidget(
                            textColor: grey,
                            text:
                                "${invitiesData.configName.toString()[5].toUpperCase()}${invitiesData.configName.toString().substring(6).toLowerCase()}")),
                  );
                },
                separatorBuilder: (context, index) {
                  return stdHeightBox;
                },
                itemCount: 1,
              ),
            ],
          );
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: skyBlue,
          elevation: 0,
          onPressed: () {
            Get.to(() =>  InvitePeopleScreen());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class HeadingWidgets extends StatelessWidget {
  const HeadingWidgets({Key? key, required this.head}) : super(key: key);
  final String head;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextStyleWidget(
          text: head,
          textSize: 18,
          textColor: grey,
          textWidth: FontWeight.w500,
        ),
        TextStyleWidget(
          text: "See All",
          textSize: 18,
          textColor: lightBlue,
          textWidth: FontWeight.w500,
        )
      ],
    );
  }
}
