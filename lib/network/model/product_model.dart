class ProductModel {
  String? message;
  int? responseCode;
  List<Data>? data;

  ProductModel({this.message, this.responseCode, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
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
  String? productName;

  Data({this.id, this.productName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    productName = json['ProductName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ProductName'] = this.productName;
    return data;
  }
}
