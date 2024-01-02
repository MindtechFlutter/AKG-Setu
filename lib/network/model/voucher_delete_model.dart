class VoucherDeleteModel {
  String? message;
  int? responseCode;
  Data? data;

  VoucherDeleteModel({this.message, this.responseCode, this.data});

  VoucherDeleteModel.fromJson(Map<String, dynamic> json) {
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
  String? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
