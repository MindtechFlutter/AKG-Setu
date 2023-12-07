class LoginModel {
  String? message;
  int? responseCode;
  Data? data;

  LoginModel({this.message, this.responseCode, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    responseCode = json['ResponseCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['ResponseCode'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? employeeDesignation;
  String? employeeEmail;
  String? employeeId;
  String? employeeMobile;
  String? employeeName;
  String? employeePhoto;

  Data(
      {this.employeeDesignation,
      this.employeeEmail,
      this.employeeId,
      this.employeeMobile,
      this.employeeName,
      this.employeePhoto});

  Data.fromJson(Map<String, dynamic> json) {
    employeeDesignation = json['EmployeeDesignation'];
    employeeEmail = json['EmployeeEmail'];
    employeeId = json['EmployeeId'];
    employeeMobile = json['EmployeeMobile'];
    employeeName = json['EmployeeName'];
    employeePhoto = json['EmployeePhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmployeeDesignation'] = this.employeeDesignation;
    data['EmployeeEmail'] = this.employeeEmail;
    data['EmployeeId'] = this.employeeId;
    data['EmployeeMobile'] = this.employeeMobile;
    data['EmployeeName'] = this.employeeName;
    data['EmployeePhoto'] = this.employeePhoto;
    return data;
  }
}
