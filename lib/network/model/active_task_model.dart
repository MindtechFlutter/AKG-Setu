class ActiveTaskModel {
  String? message;
  int? responseCode;
  List<ActiveTaskData>? data;

  ActiveTaskModel({this.message, this.responseCode, this.data});

  ActiveTaskModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    responseCode = json['ResponseCode'];
    if (json['data'] != null) {
      data = <ActiveTaskData>[];
      json['data'].forEach((v) {
        data!.add(new ActiveTaskData.fromJson(v));
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

class ActiveTaskData {
  String? callDate;
  String? callId;
  String? callIssueName;
  String? callIssueNumber;
  String? callPriority;
  String? districtName;
  String? errorDetails;
  String? latitude;
  String? longitude;
  String? problemDetails;
  String? problemExtraDetails;
  String? productGroupName;
  String? productName;
  String? remarks;
  String? societyCode;
  String? societyName;
  String? talukaName;

  ActiveTaskData(
      {this.callDate,
      this.callId,
      this.callIssueName,
      this.callIssueNumber,
      this.callPriority,
      this.districtName,
      this.errorDetails,
      this.latitude,
      this.longitude,
      this.problemDetails,
      this.problemExtraDetails,
      this.productGroupName,
      this.productName,
      this.remarks,
      this.societyCode,
      this.societyName,
      this.talukaName});

  ActiveTaskData.fromJson(Map<String, dynamic> json) {
    callDate = json['CallDate'];
    callId = json['CallId'];
    callIssueName = json['CallIssueName'];
    callIssueNumber = json['CallIssueNumber'];
    callPriority = json['CallPriority'];
    districtName = json['DistrictName'];
    errorDetails = json['ErrorDetails'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    problemDetails = json['ProblemDetails'];
    problemExtraDetails = json['ProblemExtraDetails'];
    productGroupName = json['ProductGroupName'];
    productName = json['ProductName'];
    remarks = json['Remarks'];
    societyCode = json['SocietyCode'];
    societyName = json['SocietyName'];
    talukaName = json['TalukaName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CallDate'] = this.callDate;
    data['CallId'] = this.callId;
    data['CallIssueName'] = this.callIssueName;
    data['CallIssueNumber'] = this.callIssueNumber;
    data['CallPriority'] = this.callPriority;
    data['DistrictName'] = this.districtName;
    data['ErrorDetails'] = this.errorDetails;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['ProblemDetails'] = this.problemDetails;
    data['ProblemExtraDetails'] = this.problemExtraDetails;
    data['ProductGroupName'] = this.productGroupName;
    data['ProductName'] = this.productName;
    data['Remarks'] = this.remarks;
    data['SocietyCode'] = this.societyCode;
    data['SocietyName'] = this.societyName;
    data['TalukaName'] = this.talukaName;
    return data;
  }
}
