import 'dart:convert';
import 'dart:developer';
import 'package:marlo_task/app/constants/api_endpoints.dart';
import 'package:marlo_task/app/features/contracts/model/people_model.dart';
import 'package:http/http.dart' as http;
import 'package:marlo_task/app/utilities/internet_checking.dart';

class GetAllPeopleApi {
  static Future<PeopleModel> getPeople() async {
    try {
      bool network = await InternetConnectivity.checking();
      if (network) {
        final response = await http
            .get(Uri.parse(getAllPeopleUrl), headers: {'authtoken': token});
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          return PeopleModel.fromJson(jsonDecode(response.body));
        } else {
          throw 'something went wrong !';
        }
      } else {
        return PeopleModel(message: "please check your internet connectivity");
      }
    } catch (e) {
      throw 'Something went wrong !';
    }
  }
}
