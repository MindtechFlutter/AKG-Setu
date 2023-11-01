class ScheduledServicesResponse {
  int? success;
  List<ScheduledServicesData>? data;

  ScheduledServicesResponse({this.success, this.data});

  ScheduledServicesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <ScheduledServicesData>[];
      json['data'].forEach((v) {
        data!.add(new ScheduledServicesData.fromJson(v));
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

class ScheduledServicesData {
  int? id;
  int? taskId;
  String? name;
  String? state;
  String? unit;
  String? unitBuildingName;
  String? unitArea;
  int? totalBedroom;
  String? date;
  String? dateStr;
  String? clientName;
  String? serviceName;
  String? unitType;
  String? startDatetime;
  String? waitingStartDatetime;
  int? displayComplaint;
  List<Null>? linens;
  List<Null>? amentities;
  List<Null>? toiletories;
  List<Null>? laundries;
  String? keyCode;

  ScheduledServicesData(
      {this.id,
      this.taskId,
      this.name,
      this.state,
      this.unit,
      this.unitBuildingName,
      this.unitArea,
      this.totalBedroom,
      this.date,
      this.dateStr,
      this.clientName,
      this.serviceName,
      this.unitType,
      this.startDatetime,
      this.waitingStartDatetime,
      this.displayComplaint,
      this.keyCode});

  ScheduledServicesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskId = json['task_id'];
    name = json['name'];
    state = json['state'];
    unit = json['unit'];
    unitBuildingName = json['unit_building_name'];
    unitArea = json['unit_area'];
    totalBedroom = json['total_bedroom'];
    date = json['date'];
    dateStr = json['date_str'];
    clientName = json['client_name'];
    serviceName = json['service_name'];
    unitType = json['unit_type'];
    startDatetime = json['start_datetime'];
    waitingStartDatetime = json['waiting_start_datetime'];
    displayComplaint = json['display_complaint'];

    keyCode = json['key_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['task_id'] = this.taskId;
    data['name'] = this.name;
    data['state'] = this.state;
    data['unit'] = this.unit;
    data['unit_building_name'] = this.unitBuildingName;
    data['unit_area'] = this.unitArea;
    data['total_bedroom'] = this.totalBedroom;
    data['date'] = this.date;
    data['date_str'] = this.dateStr;
    data['client_name'] = this.clientName;
    data['service_name'] = this.serviceName;
    data['unit_type'] = this.unitType;
    data['start_datetime'] = this.startDatetime;
    data['waiting_start_datetime'] = this.waitingStartDatetime;
    data['display_complaint'] = this.displayComplaint;

    data['key_code'] = this.keyCode;
    return data;
  }
}
