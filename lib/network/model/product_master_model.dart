class ProductMasterModel {
  String? message;
  int? responseCode;
  List<ProductMasterData>? data;

  ProductMasterModel({this.message, this.responseCode, this.data});

  ProductMasterModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    responseCode = json['ResponseCode'];
    if (json['data'] != null && json['data'].toString() != "{}") {
      data = <ProductMasterData>[];
      json['data'].forEach((v) {
        data!.add(new ProductMasterData.fromJson(v));
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

class ProductMasterData {
  int? id;
  String? productName;

  ProductMasterData({this.id, this.productName});

  ProductMasterData.fromJson(Map<String, dynamic> json) {
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
