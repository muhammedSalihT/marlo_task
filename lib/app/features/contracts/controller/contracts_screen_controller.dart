import 'package:get/get.dart';
import 'package:marlo_task/app/features/contracts/api_service/all_people_api.dart';
import 'package:marlo_task/app/features/contracts/controller/invite_people_controller.dart';
import 'package:marlo_task/app/features/contracts/model/people_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContractsScreenController extends GetxController {
  @override
  void onInit() {
    fetchAllPeople();
    super.onInit();
  }

  final inviteController = Get.put(InvitePeopleController());
  List<PeopleModel> peopleList = [];

  fetchAllPeople() async {
    PeopleModel result = await GetAllPeopleApi.getPeople();

    if (result.errorFlag == "SUCCESS") {
      peopleList.add(result);
      update();
    } else {
      Fluttertoast.showToast(
        msg: result.message.toString(),
      );
    }
  }
}
