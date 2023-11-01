class ServicesModel {
  int? success;
  List<Data>? data;

  ServicesModel({this.success, this.data});

  ServicesModel.fromJson(Map<String, dynamic> json) {
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
  String? groupName;
  List<Services>? services;

  Data({this.groupName, this.services});

  Data.fromJson(Map<String, dynamic> json) {
    groupName = json['group_name'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['group_name'] = this.groupName;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? id;
  String? name;
  int? sequence;
  String? serviceDescription;
  String? icon;
  double? price;
  double? pricePerHour;
  double? pricePerCleaner;
  double? priceForMaterials;
  List<Offers>? offers;

  Services(
      {this.id,
      this.name,
      this.sequence,
      this.serviceDescription,
      this.icon,
      this.price,
      this.pricePerHour,
      this.pricePerCleaner,
      this.priceForMaterials,
      this.offers});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sequence = json['sequence'];
    serviceDescription = json['service_description'];
    icon = json['icon'];
    pricePerHour = json['price_per_hour'];
    pricePerCleaner = json['price_per_cleaner'];
    priceForMaterials = json['price_for_materials'];
    price = json['price'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sequence'] = this.sequence;
    data['service_description'] = this.serviceDescription;
    data['icon'] = this.icon;
    data['price'] = this.price;
    data['price_per_hour'] = this.pricePerHour;
    data['price_per_cleaner'] = this.pricePerCleaner;
    data['price_for_materials'] = this.priceForMaterials;
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offers {
  String? categoryName;
  List<Items>? items;

  Offers({this.categoryName, this.items});

  Offers.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = this.categoryName;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? offerId;
  String? name;
  String? shortDescription;
  String? description;
  double? price;
  String? image;
  int? quantity;
  bool? showQuantitySelector;

  Items(
      {this.offerId,
      this.name,
      this.shortDescription,
      this.description,
      this.price,
      this.quantity = 0,
      this.image,
      this.showQuantitySelector = false});

  Items.fromJson(Map<String, dynamic> json) {
    offerId = json['offer_id'];
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    quantity = json["quantity"];
    quantity = json["showQuantitySelector"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offer_id'] = this.offerId;
    data['name'] = this.name;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['showQuantitySelector'] = this.showQuantitySelector;

    return data;
  }
}
