class ProblemModel {
  String? message;
  int? responseCode;
  List<ProblemData>? data;

  ProblemModel({this.message, this.responseCode, this.data});

  ProblemModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    responseCode = json['ResponseCode'];
    if (json['data'] != null) {
      data = <ProblemData>[];
      json['data'].forEach((v) {
        data!.add(new ProblemData.fromJson(v));
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

class ProblemData {
  String? error;
  int? id;
  String? problem;
  String? solution;

  ProblemData({this.error, this.id, this.problem, this.solution});

  String toString() {
    return '${problem}';
  }

  ProblemData.fromJson(Map<String, dynamic> json) {
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

var json = {
  [
    {
      "Error": "1.)SMPS  2.)Power Cable 3.)Ram 4.)Mother Board 5.)Harddisk",
      "Id": 23,
      "Problem": "CPU Problem",
      "Solution": ""
    },
    {
      "Error": "NEW LAN REQUIRED ",
      "Id": 101,
      "Problem": "Lan Problem",
      "Solution": "NEW LAN Cable"
    },
    {"Error": "", "Id": 103, "Problem": "Computer Restart ", "Solution": ""},
    {"Error": "SMPS", "Id": 105, "Problem": "NOT WORKING", "Solution": ""},
    {
      "Error": "",
      "Id": 108,
      "Problem": "Internet Not Working ",
      "Solution": ""
    },
    {"Error": "", "Id": 109, "Problem": "Online Society ", "Solution": ""},
    {"Error": "", "Id": 118, "Problem": "Display Problem", "Solution": ""},
    {"Error": "", "Id": 119, "Problem": "Mouse Problem ", "Solution": ""},
    {"Error": "", "Id": 120, "Problem": "Auto Tare Problem ", "Solution": ""},
    {"Error": "", "Id": 122, "Problem": "Restart Problem", "Solution": ""},
    {
      "Error": "",
      "Id": 126,
      "Problem": "Power Switch Problem ",
      "Solution": ""
    },
    {
      "Error": "",
      "Id": 129,
      "Problem": "Date And Time Not Update",
      "Solution": ""
    },
    {
      "Error": "",
      "Id": 131,
      "Problem": "Customer Message Problem",
      "Solution": ""
    },
    {
      "Error": "",
      "Id": 136,
      "Problem": "USB Ports Not Working",
      "Solution": ""
    },
    {
      "Error": "",
      "Id": 189,
      "Problem": "New System Installation",
      "Solution": ""
    },
    {
      "Error": "",
      "Id": 210,
      "Problem": "Harddisk Not Working.",
      "Solution": ""
    },
    {
      "Error": "",
      "Id": 214,
      "Problem": "Serial Port Not Working",
      "Solution": ""
    },
    {"Error": "", "Id": 222, "Problem": "Format PC", "Solution": ""},
    {"Error": "", "Id": 224, "Problem": "New Lan Required", "Solution": ""},
    {
      "Error": "General PC Software Setting",
      "Id": 263,
      "Problem": "General PC Software Setting",
      "Solution": "General PC Software Setting"
    },
    {"Error": "", "Id": 270, "Problem": "Working Slow", "Solution": ""},
    {"Error": "", "Id": 271, "Problem": "CPU Fan Not Working", "Solution": ""},
    {"Error": "", "Id": 272, "Problem": "Cable Problem", "Solution": ""},
    {"Error": "", "Id": 274, "Problem": "Keyboard Not Working", "Solution": ""},
    {"Error": "", "Id": 291, "Problem": "Windows Problem", "Solution": ""},
    {
      "Error": "",
      "Id": 339,
      "Problem": "Wifi Lan System Install",
      "Solution": ""
    },
    {"Error": "", "Id": 369, "Problem": "Survey Visit", "Solution": ""},
    {"Error": "", "Id": 390, "Problem": "Windows Not Genuine", "Solution": ""},
    {"Error": "", "Id": 399, "Problem": "Google Chrome Install", "Solution": ""}
  ]
};
