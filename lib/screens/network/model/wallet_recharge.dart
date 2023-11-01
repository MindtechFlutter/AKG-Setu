class WalletRechargeResponse {
  int? success;
  Data? data;

  WalletRechargeResponse({this.success, this.data});

  WalletRechargeResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  String? payment_link;

  Data({this.payment_link});

  Data.fromJson(Map<String, dynamic> json) {
    payment_link = json['payment_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['payment_link'] = this.payment_link;
    return data;
  }
}

