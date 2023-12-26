class VoucherEntryModel {
  String? message;
  int? responseCode;
  VoucherEntryData? data;

  VoucherEntryModel({this.message, this.responseCode, this.data});

  VoucherEntryModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    responseCode = json['ResponseCode'];
    data = json['data'] != null && json['data'].toString() != "{}" ?  VoucherEntryData.fromJson(json['data']) : null;
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

class VoucherEntryData {
  int? employeeID;
  int? voucherId;

  VoucherEntryData({this.employeeID, this.voucherId});

  VoucherEntryData.fromJson(Map<String, dynamic> json) {
    employeeID = json['EmployeeID'];
    voucherId = json['VoucherId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmployeeID'] = this.employeeID;
    data['VoucherId'] = this.voucherId;
    return data;
  }
}
