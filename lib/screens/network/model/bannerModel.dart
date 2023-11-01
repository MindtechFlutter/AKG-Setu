class BannerModel {
  int? success;
  List<ImageData>? data;

  BannerModel({this.success, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <ImageData>[];
      json['data'].forEach((v) {
        data!.add(new ImageData.fromJson(v));
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

class ImageData {
  String? title;
  String? url;
  String? image;

  ImageData({this.title, this.url, this.image});

  ImageData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['image'] = this.image;
    return data;
  }
}