class EmployeeMasterModel {
  String? message;
  int? responseCode;
  List<EmployeeMasterData>? data;

  EmployeeMasterModel({this.message, this.responseCode, this.data});

  EmployeeMasterModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    responseCode = json['ResponseCode'];
    if (json['data'] != null && json['data'].toString() != "{}") {
      data = <EmployeeMasterData>[];
      json['data'].forEach((v) {
        data!.add(new EmployeeMasterData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['ResponseCode'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeeMasterData {
  String? employeeName;
  int? id;

  EmployeeMasterData({this.employeeName, this.id});

  EmployeeMasterData.fromJson(Map<String, dynamic> json) {
    employeeName = json['EmployeeName'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmployeeName'] = this.employeeName;
    data['Id'] = this.id;
    return data;
  }
}
