class VoucherDetailModel {
  String? message;
  int? responseCode;
  List<VoucherDetailData>? data;

  VoucherDetailModel({this.message, this.responseCode, this.data});

  VoucherDetailModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    responseCode = json['ResponseCode'];
    if (json['data'] != null && json['data'].toString() != "{}") {
      data = <VoucherDetailData>[];
      json['data'].forEach((v) {
        data!.add(new VoucherDetailData.fromJson(v));
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

class VoucherDetailData {
  String? amount;
  String? approvalStatus;
  bool? approve;
  String? approveDate;
  String? approvedBy;
  String? approverRemarks;
  bool? callId;
  String? callIdNumber;
  String? callStatus;
  String? employeeRemarks;
  String? expenseType;
  String? fromPlace;
  bool? gSTBill;
  int? id;
  String? imageURL;
  String? mode;
  String? modifiedBy;
  String? modifiedDate;
  String? oReason;
  String? paymentAmount;
  bool? paymentReceived;
  String? paymentType;
  String? rate;
  bool? serviceReport;
  bool? ticketBill;
  String? toPlace;
  String? totalkm;
  String? travelType;
  String? uAmount;
  String? uRate;
  int? uTotalkm;
  String? vehicleType;
  String? visitPurpose;
  String? voucherDate;
  String? voucherReceivedDate;

  VoucherDetailData(
      {this.amount,
      this.approvalStatus,
      this.approve,
      this.approveDate,
      this.approvedBy,
      this.approverRemarks,
      this.callId,
      this.callIdNumber,
      this.callStatus,
      this.employeeRemarks,
      this.expenseType,
      this.fromPlace,
      this.gSTBill,
      this.id,
      this.imageURL,
      this.mode,
      this.modifiedBy,
      this.modifiedDate,
      this.oReason,
      this.paymentAmount,
      this.paymentReceived,
      this.paymentType,
      this.rate,
      this.serviceReport,
      this.ticketBill,
      this.toPlace,
      this.totalkm,
      this.travelType,
      this.uAmount,
      this.uRate,
      this.uTotalkm,
      this.vehicleType,
      this.visitPurpose,
      this.voucherDate,
      this.voucherReceivedDate});

  VoucherDetailData.fromJson(Map<String, dynamic> json) {
    amount = json['Amount'];
    approvalStatus = json['ApprovalStatus'];
    approve = json['Approve'];
    approveDate = json['ApproveDate'];
    approvedBy = json['ApprovedBy'];
    approverRemarks = json['ApproverRemarks'];
    callId = json['CallId'];
    callIdNumber = json['CallIdNumber'];
    callStatus = json['CallStatus'];
    employeeRemarks = json['EmployeeRemarks'];
    expenseType = json['ExpenseType'];
    fromPlace = json['FromPlace'];
    gSTBill = json['GSTBill'];
    id = json['Id'];
    imageURL = json['ImageURL'];
    mode = json['Mode'];
    modifiedBy = json['ModifiedBy'];
    modifiedDate = json['ModifiedDate'];
    oReason = json['OReason'];
    paymentAmount = json['PaymentAmount'];
    paymentReceived = json['PaymentReceived'];
    paymentType = json['PaymentType'];
    rate = json['Rate'];
    serviceReport = json['ServiceReport'];
    ticketBill = json['TicketBill'];
    toPlace = json['ToPlace'];
    totalkm = json['Totalkm'];
    travelType = json['TravelType'];
    uAmount = json['UAmount'];
    uRate = json['URate'];
    uTotalkm = json['UTotalkm'];
    vehicleType = json['VehicleType'];
    visitPurpose = json['VisitPurpose'];
    voucherDate = json['VoucherDate'];
    voucherReceivedDate = json['VoucherReceivedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Amount'] = this.amount;
    data['ApprovalStatus'] = this.approvalStatus;
    data['Approve'] = this.approve;
    data['ApproveDate'] = this.approveDate;
    data['ApprovedBy'] = this.approvedBy;
    data['ApproverRemarks'] = this.approverRemarks;
    data['CallId'] = this.callId;
    data['CallIdNumber'] = this.callIdNumber;
    data['CallStatus'] = this.callStatus;
    data['EmployeeRemarks'] = this.employeeRemarks;
    data['ExpenseType'] = this.expenseType;
    data['FromPlace'] = this.fromPlace;
    data['GSTBill'] = this.gSTBill;
    data['Id'] = this.id;
    data['ImageURL'] = this.imageURL;
    data['Mode'] = this.mode;
    data['ModifiedBy'] = this.modifiedBy;
    data['ModifiedDate'] = this.modifiedDate;
    data['OReason'] = this.oReason;
    data['PaymentAmount'] = this.paymentAmount;
    data['PaymentReceived'] = this.paymentReceived;
    data['PaymentType'] = this.paymentType;
    data['Rate'] = this.rate;
    data['ServiceReport'] = this.serviceReport;
    data['TicketBill'] = this.ticketBill;
    data['ToPlace'] = this.toPlace;
    data['Totalkm'] = this.totalkm;
    data['TravelType'] = this.travelType;
    data['UAmount'] = this.uAmount;
    data['URate'] = this.uRate;
    data['UTotalkm'] = this.uTotalkm;
    data['VehicleType'] = this.vehicleType;
    data['VisitPurpose'] = this.visitPurpose;
    data['VoucherDate'] = this.voucherDate;
    data['VoucherReceivedDate'] = this.voucherReceivedDate;
    return data;
  }
}
