class ValidateModel {
  int? success;
  Mdata? data;

  ValidateModel({this.success, this.data});

  ValidateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Mdata.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Mdata {
  String? message;
  int? userId;
  String? userName;
  String? userPhone;
  String? userType;
  String? isIndividualUser;

  Mdata(
      {this.message,
      this.userId,
      this.userName,
      this.userPhone,
      this.userType,
      this.isIndividualUser});

  Mdata.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['user_id'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    userType = json['user_type'];
    isIndividualUser = json['is_individual_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_phone'] = this.userPhone;
    data['user_type'] = this.userType;
    data['is_individual_user'] = this.isIndividualUser;
    return data;
  }
}
