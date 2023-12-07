class ProductGroupModel {
  String? message;
  int? responseCode;
  List<Data>? data;

  ProductGroupModel({this.message, this.responseCode, this.data});

  ProductGroupModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    responseCode = json['ResponseCode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? productGroupName;

  Data({this.id, this.productGroupName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    productGroupName = json['ProductGroupName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ProductGroupName'] = this.productGroupName;
    return data;
  }
}