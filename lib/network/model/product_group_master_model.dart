class ProductGroupMasterModel {
  String? message;
  int? responseCode;
  List<ProductGroupMasterData>? data;

  ProductGroupMasterModel({this.message, this.responseCode, this.data});

  ProductGroupMasterModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    responseCode = json['ResponseCode'];
    if (json['data'] != null && json['data'].toString() != "{}") {
      data = <ProductGroupMasterData>[];
      json['data'].forEach((v) {
        data!.add(new ProductGroupMasterData.fromJson(v));
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

class ProductGroupMasterData {
  int? id;
  String? productGroupName;

  ProductGroupMasterData({this.id, this.productGroupName});

  ProductGroupMasterData.fromJson(Map<String, dynamic> json) {
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
