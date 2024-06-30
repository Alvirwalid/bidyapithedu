class EmployeeInfoSaveModel {
  bool? status;
  String? message;
  String? messageBn;
  Data? data;

  EmployeeInfoSaveModel({this.status, this.message, this.messageBn, this.data});

  EmployeeInfoSaveModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageBn = json['messageBn'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['messageBn'] = this.messageBn;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  bool? active;
  int? empPersonalInfoId;
  String? empPersonalInfoName;
  int? empTypeId;
  String? empTypeName;
  int? batchId;
  String? batchName;
  int? designationId;
  String? designationName;
  Null? gradeId;
  String? gradeName;
  int? departmentId;
  String? departmentName;
  int? officeId;
  String? officeName;
  String? empOfficialPhone;
  String? empOfficialEmail;
  String? joiningDate;
  String? inactiveDate;
  int? inactiveTypeId;
  String? inactiveTypeName;
  String? inactiveReason;

  Data(
      {this.id,
        this.active,
        this.empPersonalInfoId,
        this.empPersonalInfoName,
        this.empTypeId,
        this.empTypeName,
        this.batchId,
        this.batchName,
        this.designationId,
        this.designationName,
        this.gradeId,
        this.gradeName,
        this.departmentId,
        this.departmentName,
        this.officeId,
        this.officeName,
        this.empOfficialPhone,
        this.empOfficialEmail,
        this.joiningDate,
        this.inactiveDate,
        this.inactiveTypeId,
        this.inactiveTypeName,
        this.inactiveReason});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    empPersonalInfoId = json['empPersonalInfoId'];
    empPersonalInfoName = json['empPersonalInfoName'];
    empTypeId = json['empTypeId'];
    empTypeName = json['empTypeName'];
    batchId = json['batchId'];
    batchName = json['batchName'];
    designationId = json['designationId'];
    designationName = json['designationName'];
    gradeId = json['gradeId'];
    gradeName = json['gradeName'];
    departmentId = json['departmentId'];
    departmentName = json['departmentName'];
    officeId = json['officeId'];
    officeName = json['officeName'];
    empOfficialPhone = json['empOfficialPhone'];
    empOfficialEmail = json['empOfficialEmail'];
    joiningDate = json['joiningDate'];
    inactiveDate = json['inactiveDate'];
    inactiveTypeId = json['inactiveTypeId'];
    inactiveTypeName = json['inactiveTypeName'];
    inactiveReason = json['inactiveReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['empPersonalInfoId'] = this.empPersonalInfoId;
    data['empPersonalInfoName'] = this.empPersonalInfoName;
    data['empTypeId'] = this.empTypeId;
    data['empTypeName'] = this.empTypeName;
    data['batchId'] = this.batchId;
    data['batchName'] = this.batchName;
    data['designationId'] = this.designationId;
    data['designationName'] = this.designationName;
    data['gradeId'] = this.gradeId;
    data['gradeName'] = this.gradeName;
    data['departmentId'] = this.departmentId;
    data['departmentName'] = this.departmentName;
    data['officeId'] = this.officeId;
    data['officeName'] = this.officeName;
    data['empOfficialPhone'] = this.empOfficialPhone;
    data['empOfficialEmail'] = this.empOfficialEmail;
    data['joiningDate'] = this.joiningDate;
    data['inactiveDate'] = this.inactiveDate;
    data['inactiveTypeId'] = this.inactiveTypeId;
    data['inactiveTypeName'] = this.inactiveTypeName;
    data['inactiveReason'] = this.inactiveReason;
    return data;
  }
}