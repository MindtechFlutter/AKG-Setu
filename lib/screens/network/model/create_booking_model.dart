class CreateBooking {
  bool? unitId;
  String? userId;
  String? isFromB2c = '1';
  String? serviceId;
  String? plumbingServiceText;
  String? acMaintenanceText;
  String? paintingText;
  String? handyManJobText;
  String? keyCode;
  List<String> linenTowelLines;
  List<String> laundryLines;
  List<String> amenitiesLines;
  List<String> toiletriesLines;
  List<String> furnitureLine;
  String? scheduledDateStart;
  bool? sofaBed;
  bool? linenTowel;
  bool? amenities;
  bool? toiletries;
  bool? unboxing;
  bool? withoutUnboxing;
  bool? plumbingService;
  bool? acMaintenance;
  bool? painting;
  bool? handyManJob;
  String? frequency;
  String? addressId;
  int? noOfHours;
  int? noOfProfessionals;
  bool? requireCleaningMaterials;
  List<Offer>? offer;
  double? no_of_hours_total;
  double? no_of_professionals_total;
  double? required_materials_total;

  CreateBooking({
    this.unitId,
    this.userId,
    this.serviceId,
    this.plumbingServiceText,
    this.acMaintenanceText,
    this.paintingText,
    this.handyManJobText,
    this.keyCode,
    this.isFromB2c,
    List<String>? linenTowelLines,
    List<String>? laundryLines,
    List<String>? amenitiesLines,
    List<String>? toiletriesLines,
    List<String>? furnitureLine,
    this.scheduledDateStart,
    this.sofaBed,
    this.linenTowel,
    this.amenities,
    this.toiletries,
    this.unboxing,
    this.withoutUnboxing,
    this.plumbingService,
    this.acMaintenance,
    this.painting,
    this.handyManJob,
    this.frequency,
    this.addressId,
    this.noOfHours,
    this.noOfProfessionals,
    this.requireCleaningMaterials,
    this.offer,
    this.no_of_hours_total,
    this.no_of_professionals_total,
    this.required_materials_total,
  })  : linenTowelLines = linenTowelLines ?? [],
        laundryLines = laundryLines ?? [],
        amenitiesLines = amenitiesLines ?? [],
        toiletriesLines = toiletriesLines ?? [],
        furnitureLine = furnitureLine ?? [];

  CreateBooking.fromJson(Map<String, dynamic> json)
      : unitId = json['unit_id'],
        userId = json['user_id'],
        serviceId = json['service_id'],
        isFromB2c = json['is_booking_from_b2c'],
        plumbingServiceText = json['plumbing_service_text'],
        acMaintenanceText = json['ac_maintenance_text'],
        paintingText = json['painting_text'],
        handyManJobText = json['handy_man_job_text'],
        keyCode = json['key_code'],
        scheduledDateStart = json['scheduled_date_start'],
        sofaBed = json['sofa_bed'],
        linenTowel = json['linen_towel'],
        amenities = json['amenities'],
        toiletries = json['toiletries'],
        unboxing = json['unboxing'],
        withoutUnboxing = json['without_unboxing'],
        plumbingService = json['plumbing_service'],
        acMaintenance = json['ac_maintenance'],
        painting = json['painting'],
        handyManJob = json['handy_man_job'],
        frequency = json['frequency'],
        addressId = json['address_id'],
        noOfHours = json['no_of_hours'],
        no_of_hours_total = json['no_of_hours_total'],
        no_of_professionals_total = json['no_of_professionals_total'],
        required_materials_total = json['required_materials_total'],
        noOfProfessionals = json['no_of_professionals'],
        requireCleaningMaterials = json['require_cleaning_materials'],
        linenTowelLines = List<String>.from(json['linen_towel_lines'] ?? []),
        laundryLines = List<String>.from(json['laundry_lines'] ?? []),
        amenitiesLines = List<String>.from(json['amenities_lines'] ?? []),
        toiletriesLines = List<String>.from(json['toiletries_lines'] ?? []),
        furnitureLine = List<String>.from(json['furniture_line'] ?? []),
        offer = (json['offer'] as List<dynamic>?)
            ?.map((offerJson) => Offer.fromJson(offerJson))
            .toList();

  Map<String, dynamic> toJson() {
    return {
      'unit_id': unitId,
      'user_id': userId,
      'service_id': serviceId,
      'plumbing_service_text': plumbingServiceText,
      'ac_maintenance_text': acMaintenanceText,
      'painting_text': paintingText,
      'handy_man_job_text': handyManJobText,
      'is_booking_from_b2c': isFromB2c,
      'key_code': keyCode,
      'linen_towel_lines': linenTowelLines,
      'laundry_lines': laundryLines,
      'amenities_lines': amenitiesLines,
      'toiletries_lines': toiletriesLines,
      'furniture_line': furnitureLine,
      'scheduled_date_start': scheduledDateStart,
      'sofa_bed': sofaBed,
      'linen_towel': linenTowel,
      'amenities': amenities,
      'toiletries': toiletries,
      'unboxing': unboxing,
      'without_unboxing': withoutUnboxing,
      'plumbing_service': plumbingService,
      'ac_maintenance': acMaintenance,
      'painting': painting,
      'handy_man_job': handyManJob,
      'frequency': frequency,
      'address_id': addressId,
      'no_of_hours': noOfHours,
      'no_of_hours_total': no_of_hours_total,
      'no_of_professionals_total': no_of_professionals_total,
      'required_materials_total': required_materials_total,
      'no_of_professionals': noOfProfessionals,
      'require_cleaning_materials': requireCleaningMaterials,
      'offer': offer?.map((offer) => offer.toJson()).toList(),
    };
  }
}

class Offer {
  int? offerId;
  int? quantity;
  double? price;
  String? offerName;
  String? offerShortDes;

  Offer(
      {this.offerId,
      this.quantity,
      this.price,
      this.offerName,
      this.offerShortDes});

  Offer.fromJson(Map<String, dynamic> json)
      : offerId = json['offer_id'],
        quantity = json['quantity'],
        offerName = json['offerName'],
        offerShortDes = json['offerShortDes'],
        price = json['price'];

  Map<String, dynamic> toJson() {
    return {
      'offer_id': offerId,
      'quantity': quantity,
      'price': price,
      'offerName': offerName,
      'offerShortDes': offerShortDes,
    };
  }
}
