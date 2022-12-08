class InvitePeopleModel {
  InvitePeopleModel({
    this.errorFlag,
    this.message,
    this.data,
  });

  String? errorFlag;
  String? message;
  Datas? data;

  factory InvitePeopleModel.fromJson(Map<String, dynamic> json) =>
      InvitePeopleModel(
        errorFlag: json["error_flag"],
        message: json["message"],
        data: Datas.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error_flag": errorFlag,
        "message": message,
        "data": data!.toJson(),
      };
}

class Datas {
  Datas({
    this.email,
    this.role,
  });
  String? email;
  String? role;

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
        email: json["email"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "role": role,
      };
}
