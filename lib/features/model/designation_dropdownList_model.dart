class DesignationDropDownModel {
  bool? status;
  String? message;
  String? messageBn;
  List<Data>? data;

  DesignationDropDownModel(
      {this.status, this.message, this.messageBn, this.data});

  DesignationDropDownModel.fromJson(Map<String, dynamic> json) {
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
  bool? active;
  int? masterId;
  String? masterName;
  String? name;
  String? banglaName;
  int? parentId;
  String? parentName;
  String? abbre;
  String? abbreBn;
  String? areaTeleCode;
  String? telephone;
  String? telephone1;
  String? pabx;
  String? webAddress;
  String? emailAddress;
  String? address;
  String? addressBn;
  String? shortCode;
  int? moduleId;
  int? facultyId;
  String? facultyName;
  int? devCode;

  Data(
      {this.id,
        this.active,
        this.masterId,
        this.masterName,
        this.name,
        this.banglaName,
        this.parentId,
        this.parentName,
        this.abbre,
        this.abbreBn,
        this.areaTeleCode,
        this.telephone,
        this.telephone1,
        this.pabx,
        this.webAddress,
        this.emailAddress,
        this.address,
        this.addressBn,
        this.shortCode,
        this.moduleId,
        this.facultyId,
        this.facultyName,
        this.devCode});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    masterId = json['masterId'];
    masterName = json['masterName'];
    name = json['name'];
    banglaName = json['banglaName'];
    parentId = json['parentId'];
    parentName = json['parentName'];
    abbre = json['abbre'];
    abbreBn = json['abbreBn'];
    areaTeleCode = json['areaTeleCode'];
    telephone = json['telephone'];
    telephone1 = json['telephone1'];
    pabx = json['pabx'];
    webAddress = json['webAddress'];
    emailAddress = json['emailAddress'];
    address = json['address'];
    addressBn = json['addressBn'];
    shortCode = json['shortCode'];
    moduleId = json['moduleId'];
    facultyId = json['facultyId'];
    facultyName = json['facultyName'];
    devCode = json['devCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['masterId'] = this.masterId;
    data['masterName'] = this.masterName;
    data['name'] = this.name;
    data['banglaName'] = this.banglaName;
    data['parentId'] = this.parentId;
    data['parentName'] = this.parentName;
    data['abbre'] = this.abbre;
    data['abbreBn'] = this.abbreBn;
    data['areaTeleCode'] = this.areaTeleCode;
    data['telephone'] = this.telephone;
    data['telephone1'] = this.telephone1;
    data['pabx'] = this.pabx;
    data['webAddress'] = this.webAddress;
    data['emailAddress'] = this.emailAddress;
    data['address'] = this.address;
    data['addressBn'] = this.addressBn;
    data['shortCode'] = this.shortCode;
    data['moduleId'] = this.moduleId;
    data['facultyId'] = this.facultyId;
    data['facultyName'] = this.facultyName;
    data['devCode'] = this.devCode;
    return data;
  }
}