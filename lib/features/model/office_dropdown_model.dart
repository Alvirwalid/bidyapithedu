class OfficeDropDownModel {
  bool? status;
  String? message;
  String? messageBn;
  List<Data>? data;

  OfficeDropDownModel({this.status, this.message, this.messageBn, this.data});

  OfficeDropDownModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageBn = json['messageBn'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['messageBn'] = this.messageBn;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  int? id;
  String? extra;
  String? extraFromDate;
  String? extraToDate;
  String? officeName;
  String? departmentName;
  String? sectionName;
  String? designationName;
  String? extraName;

  Data(
      {this.name,
        this.id,
        this.extra,
        this.extraFromDate,
        this.extraToDate,
        this.officeName,
        this.departmentName,
        this.sectionName,
        this.designationName,
        this.extraName});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    extra = json['extra'];
    extraFromDate = json['extraFromDate'];
    extraToDate = json['extraToDate'];
    officeName = json['officeName'];
    departmentName = json['departmentName'];
    sectionName = json['sectionName'];
    designationName = json['designationName'];
    extraName = json['extraName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['extra'] = this.extra;
    data['extraFromDate'] = this.extraFromDate;
    data['extraToDate'] = this.extraToDate;
    data['officeName'] = this.officeName;
    data['departmentName'] = this.departmentName;
    data['sectionName'] = this.sectionName;
    data['designationName'] = this.designationName;
    data['extraName'] = this.extraName;
    return data;
  }
}