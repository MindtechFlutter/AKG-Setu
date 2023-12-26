class SpareMasterModel {
  String? message;
  int? responseCode;
  List<SpareMasterData>? data;

  SpareMasterModel({this.message, this.responseCode, this.data});

  SpareMasterModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    responseCode = json['ResponseCode'];
    if (json['data'] != null && json['data'].toString() !="{}") {
      data = <SpareMasterData>[];
      json['data'].forEach((v) {
        data!.add(new SpareMasterData.fromJson(v));
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

class SpareMasterData {
  int? id;
  String? spareName;

  SpareMasterData({this.id, this.spareName});

  SpareMasterData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    spareName = json['SpareName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['SpareName'] = this.spareName;
    return data;
  }
}
