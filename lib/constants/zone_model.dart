class ZoneModel {
  bool? status;
  String? message;
  String? messageBn;
  List<Data>? data;

  ZoneModel({this.status, this.message, this.messageBn, this.data});

  ZoneModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? banglaName;
  bool? active;
  int? masterId;
  String? masterName;
  String? masterNameBn;
  int? parentId;
  String? parentName;
  String? parentNameBn;
  String? shortCode;
  int? moduleId;

  Data(
      {this.id,
        this.name,
        this.banglaName,
        this.active,
        this.masterId,
        this.masterName,
        this.masterNameBn,
        this.parentId,
        this.parentName,
        this.parentNameBn,
        this.shortCode,
        this.moduleId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    banglaName = json['banglaName'];
    active = json['active'];
    masterId = json['masterId'];
    masterName = json['masterName'];
    masterNameBn = json['masterNameBn'];
    parentId = json['parentId'];
    parentName = json['parentName'];
    parentNameBn = json['parentNameBn'];
    shortCode = json['shortCode'];
    moduleId = json['moduleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['banglaName'] = this.banglaName;
    data['active'] = this.active;
    data['masterId'] = this.masterId;
    data['masterName'] = this.masterName;
    data['masterNameBn'] = this.masterNameBn;
    data['parentId'] = this.parentId;
    data['parentName'] = this.parentName;
    data['parentNameBn'] = this.parentNameBn;
    data['shortCode'] = this.shortCode;
    data['moduleId'] = this.moduleId;
    return data;
  }
}