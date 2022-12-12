import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:marlo_task/app/features/contracts/api_service/invite_people_service.dart';
import 'package:marlo_task/app/features/contracts/model/invite_people_model.dart';

import '../../../utilities/internet_checking.dart';

class InvitePeopleController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  String invitingRole = "Admin";
  bool netCheck = false;

  void disposeWidget() {
    emailController.clear();
    invitingRole = "Admin";
    update();
    Get.back();
  }

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }

  List<String> roles = ['Admin', "Approver", "Prepare", "Viewer", "Employee"];

  void roleSelected(int newIndex) {
    invitingRole = roles[newIndex];
    update();
  }

  Future<String> inviteButtonPressed() async {
    netCheck = true;
    update();
    if (formKey.currentState!.validate()) {
      if (emailController.text.isEmpty) {
        Fluttertoast.showToast(
          msg: "Please enter email",
        );
        netCheck = false;
        update();
        return "";
      }
    }

    bool network = await InternetConnectivity.checking();
    if (network) {
      final data = Datas(
        email: emailController.text.trim(),
        role: (roles.indexOf(invitingRole) + 1).toString(),
      ).toJson();
      InvitePeopleModel responce = await InvitePeopleApi.postInvitePeople(data);

      if (responce.message == "SUCCESS") {
        Fluttertoast.showToast(
          msg: responce.message.toString(),
          toastLength: Toast.LENGTH_LONG,
        );
        netCheck = false;
        update();
        return responce.message!;
      } else {
        Fluttertoast.showToast(
          msg: responce.errorFlag.toString(),
          toastLength: Toast.LENGTH_LONG,
        );
        netCheck = false;
        update();
        return "";
      }
    } else {
      Fluttertoast.showToast(
        msg: "please check your internet connectivity",
        toastLength: Toast.LENGTH_LONG,
      );
      netCheck = false;
      update();
      return "";
    }
  }
}
