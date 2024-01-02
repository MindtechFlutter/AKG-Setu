class VoucherImageUploadModel {
  String? message;
  int? responseCode;
  List<VoucherImageUploadListData>? data;

  VoucherImageUploadModel({this.message, this.responseCode, this.data});

  VoucherImageUploadModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    responseCode = json['ResponseCode'];
    if (json['data'] != null) {
      data = <VoucherImageUploadListData>[];
      json['data'].forEach((v) {
        data!.add(new VoucherImageUploadListData.fromJson(v));
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

class VoucherImageUploadListData {
  int? id;
  int? voucherId;
  String? voucherURL;

  VoucherImageUploadListData({this.id, this.voucherId, this.voucherURL});

  VoucherImageUploadListData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    voucherId = json['VoucherId'];
    voucherURL = json['VoucherURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['VoucherId'] = this.voucherId;
    data['VoucherURL'] = this.voucherURL;
    return data;
  }
}
