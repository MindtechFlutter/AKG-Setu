class AddressListModel {
  int? success;
  List<AddressListData>? addressListData;

  AddressListModel({this.success, this.addressListData});

  AddressListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      addressListData = <AddressListData>[];
      json['data'].forEach((v) {
        addressListData!.add(new AddressListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.addressListData != null) {
      data['data'] = this.addressListData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressListData {
  int? addressId;
  String? type;
  String? buildingName;
  String? streetName;
  String? emirate;
  String? latitude;
  String? longitude;
  bool? isSelected;

  AddressListData(
      {this.addressId,
      this.type,
      this.buildingName,
      this.streetName,
      this.emirate,
      this.latitude,
      this.longitude,
      this.isSelected = false});

  AddressListData.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    type = json['type'];
    buildingName = json['building_name'];
    streetName = json['street_name'];
    emirate = json['emirate'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['type'] = this.type;
    data['building_name'] = this.buildingName;
    data['street_name'] = this.streetName;
    data['emirate'] = this.emirate;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['isSelected'] = this.isSelected;
    return data;
  }
}
