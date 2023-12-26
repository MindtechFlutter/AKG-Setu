class ProblemMasterModel {
  String? message;
  int? responseCode;
  List<ProblemMasterData>? data;

  ProblemMasterModel({this.message, this.responseCode, this.data});

  ProblemMasterModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    responseCode = json['ResponseCode'];
    if (json['data'] != null) {
      data = <ProblemMasterData>[];
      json['data'].forEach((v) {
        data!.add(new ProblemMasterData.fromJson(v));
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

class ProblemMasterData {
  String? error;
  int? id;
  String? problem;
  String? solution;

  ProblemMasterData({this.error, this.id, this.problem, this.solution});

  ProblemMasterData.fromJson(Map<String, dynamic> json) {
    error = json['Error'];
    id = json['Id'];
    problem = json['Problem'];
    solution = json['Solution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Error'] = this.error;
    data['Id'] = this.id;
    data['Problem'] = this.problem;
    data['Solution'] = this.solution;
    return data;
  }
}
