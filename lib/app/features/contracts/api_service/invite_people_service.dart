import 'dart:convert';
import 'dart:developer';

import 'package:marlo_task/app/constants/api_endpoints.dart';
import 'package:marlo_task/app/features/contracts/model/invite_people_model.dart';
import 'package:http/http.dart' as http;

class InvitePeopleApi {
  static Future<InvitePeopleModel> postInvitePeople(data) async {
    try {
      final responce = await http.post(Uri.parse(invitePeopleUrl),
          headers: {'authtoken': token}, body: data);
      log(responce.statusCode.toString());
      if (responce.statusCode >= 200) {
        return InvitePeopleModel.fromJson(jsonDecode(responce.body));
      } else {
        return InvitePeopleModel.fromJson(jsonDecode(responce.body));
      }
    } catch (e) {
      log(e.toString());
      return InvitePeopleModel(errorFlag: e.toString());
    }
  }
}
