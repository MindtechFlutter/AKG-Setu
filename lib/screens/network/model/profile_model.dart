class ProfileModel {
  int? success;
  List<Data>? data;

  ProfileModel({this.success, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? email;
  int? countryId;
  String? profileImage;
  int? notificationBit;
  String? phone;

  Data(
      {this.firstName,
      this.lastName,
      this.email,
      this.countryId,
      this.profileImage,
      this.notificationBit,
      this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    countryId = json['country_id'];
    phone = json['phone'];

    profileImage = json['profile_image'];
    notificationBit = json['notification_bit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['country_id'] = this.countryId;
    data['profile_image'] = this.profileImage;
    data['notification_bit'] = this.notificationBit;
    data['phone'] = this.phone;
    return data;
  }
}
