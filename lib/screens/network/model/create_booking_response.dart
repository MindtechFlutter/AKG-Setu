class CreateBookingResponse {
  String? jsonrpc;
  Null? id;
  Result? result;

  CreateBookingResponse({this.jsonrpc, this.id, this.result});

  CreateBookingResponse.fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jsonrpc'] = this.jsonrpc;
    data['id'] = this.id;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  int? success;
  String? message;
  int? bookingId;
  int? storeManagerId;
  String? paymentLink;

  Result(
      {this.success,
        this.message,
        this.bookingId,
        this.storeManagerId,
        this.paymentLink});

  Result.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    bookingId = json['booking_id'];
    storeManagerId = json['store_manager_id'];
    paymentLink = json['payment_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['booking_id'] = this.bookingId;
    data['store_manager_id'] = this.storeManagerId;
    data['payment_link'] = this.paymentLink;
    return data;
  }
}