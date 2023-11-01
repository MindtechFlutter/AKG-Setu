class LoginModel {
  int? success;
  LoginData? data;

  LoginModel({this.success, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
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

class LoginData {
  String? name;
  String? phone;
  String? otpCode;
  String? message;

  LoginData({this.name, this.phone, this.otpCode, this.message});

  LoginData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    otpCode = json['otp_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['otp_code'] = this.otpCode;
    data['message'] = this.message;
    return data;
  }
}
