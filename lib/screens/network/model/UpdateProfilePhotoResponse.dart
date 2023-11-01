class UpdateProfilePhotoResponse {
  int? success;
  Data? data;

  UpdateProfilePhotoResponse({this.success, this.data});

  UpdateProfilePhotoResponse.fromJson(Map<String, dynamic> json) {
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
  String? message;
  String? filename;
  String? image;
  String? mimetype;

  Data({this.message, this.filename, this.image, this.mimetype});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    filename = json['filename'];
    image = json['image'];
    mimetype = json['mimetype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['filename'] = this.filename;
    data['image'] = this.image;
    data['mimetype'] = this.mimetype;
    return data;
  }
}