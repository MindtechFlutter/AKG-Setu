class WalletResponse {
  int? success;
  Data? data;

  WalletResponse({this.success, this.data});
  WalletResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      if (json['data'] is List && json['data'].isEmpty) {
        data = null;
      } else {
        data = Data.fromJson(json['data']);
      }
    }
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
  double? totalBalance;
  List<Transaction>? transactionIds;

  Data({this.totalBalance, this.transactionIds});

  Data.fromJson(Map<String, dynamic> json) {
    totalBalance = json['total_balance'];
    if (json['transaction_ids'] != null) {
      transactionIds = <Transaction>[];
      json['transaction_ids'].forEach((v) {
        transactionIds!.add(new Transaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_balance'] = this.totalBalance;
    if (this.transactionIds != null) {
      data['transaction_ids'] =
          this.transactionIds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transaction {
  String? transactionNo;
  String? date;
  double? amount;
  String? transactionType;

  Transaction({this.transactionNo, this.date, this.amount, this.transactionType});

  Transaction.fromJson(Map<String, dynamic> json) {
    transactionNo = json['transaction_no'];
    date = json['date'];
    amount = json['amount'];
    transactionType = json['transaction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_no'] = this.transactionNo;
    data['date'] = this.date;
    data['amount'] = this.amount;
    data['transaction_type'] = this.transactionType;
    return data;
  }
}