import 'package:hive/hive.dart';

part 'employee_info.g.dart';

@HiveType(typeId: 4)

class EmployeeInfo {
  @HiveField(1)
  bool? status;
  @HiveField(2)
  String? message;
  @HiveField(3)
  String? messageBn;
  @HiveField(4)
  Data? data;

  EmployeeInfo({this.status, this.message, this.messageBn, this.data});

  EmployeeInfo.fromJson(Map<String, dynamic> json) {
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
@HiveType(typeId: 5)
class Data {
  @HiveField(1)
  int? id;
  @HiveField(2)
  bool? active;
  @HiveField(3)
  String? impId;
  @HiveField(4)
  String? imageFileLocation;
  @HiveField(5)
  String? imageFileName;
  @HiveField(6)
  String? name;
  @HiveField(7)
  String? nameBn;
  @HiveField(8)
  String? fatherName;
  @HiveField(9)
  String? fatherNameBn;
  @HiveField(10)
  String? motherName;
  @HiveField(11)
  String? motherNameBn;
  @HiveField(12)
  String? mobileNo;
  @HiveField(13)
  String? phoneNo;
  @HiveField(14)
  String? email;
  @HiveField(15)
  String? fax;
  @HiveField(16)
  String? dob;
  @HiveField(17)
  String? nid;
  @HiveField(18)
  int? genderId;
  @HiveField(19)
  String? genderName;
  @HiveField(20)
  int? bloodGroupId;
  @HiveField(21)
  String? bloodGroupName;
  @HiveField(22)
  int? maritalStatusId;
  @HiveField(23)
  String? maritalStatusName;
  @HiveField(24)
  int? religionId;
  @HiveField(25)
  String? religionName;
  @HiveField(26)
  int? nationalityId;
  @HiveField(27)
  String? nationalityName;
  @HiveField(28)
  String? presentCareOf;
  @HiveField(29)
  String? presentVillageHouse;
  @HiveField(30)
  String? presentDistrictId;
  @HiveField(31)
  String? presentDistrictName;
  @HiveField(32)
  int? presentUpazilaId;
  @HiveField(33)
  String? presentUpazilaName;
  @HiveField(34)
  String? presentPostCode;
  @HiveField(35)
  String? parmanentCareOf;
  @HiveField(36)
  String? parmanentVillageHouse;
  @HiveField(37)
  int? permanentDistrictId;
  @HiveField(38)
  String? permanentDistrictName;
  @HiveField(39)
  int? permanentUpazilaId;
  @HiveField(40)
  String? permanentUpazilaName;
  @HiveField(41)
  String? permanentPostCode;
  @HiveField(42)
  bool? freedomFighterIs;
  @HiveField(43)
  String? prlStartDate;
  @HiveField(44)
  String? prlEndDate;
  @HiveField(45)
  String? retiredDate;
  @HiveField(46)
  int? appUserId;
  @HiveField(47)
  String? appUserName;
  @HiveField(48)
  bool? confirmIs;
  @HiveField(49)
  String? confirmBy;
  @HiveField(50)
  String? confirmDate;

  Data(
      {this.id,
        this.active,
        this.impId,
        this.imageFileLocation,
        this.imageFileName,
        this.name,
        this.nameBn,
        this.fatherName,
        this.fatherNameBn,
        this.motherName,
        this.motherNameBn,
        this.mobileNo,
        this.phoneNo,
        this.email,
        this.fax,
        this.dob,
        this.nid,
        this.genderId,
        this.genderName,
        this.bloodGroupId,
        this.bloodGroupName,
        this.maritalStatusId,
        this.maritalStatusName,
        this.religionId,
        this.religionName,
        this.nationalityId,
        this.nationalityName,
        this.presentCareOf,
        this.presentVillageHouse,
        this.presentDistrictId,
        this.presentDistrictName,
        this.presentUpazilaId,
        this.presentUpazilaName,
        this.presentPostCode,
        this.parmanentCareOf,
        this.parmanentVillageHouse,
        this.permanentDistrictId,
        this.permanentDistrictName,
        this.permanentUpazilaId,
        this.permanentUpazilaName,
        this.permanentPostCode,
        this.freedomFighterIs,
        this.prlStartDate,
        this.prlEndDate,
        this.retiredDate,
        this.appUserId,
        this.appUserName,
        this.confirmIs,
        this.confirmBy,
        this.confirmDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    impId = json['impId'];
    imageFileLocation = json['imageFileLocation'];
    imageFileName = json['imageFileName'];
    name = json['name'];
    nameBn = json['nameBn'];
    fatherName = json['fatherName'];
    fatherNameBn = json['fatherNameBn'];
    motherName = json['motherName'];
    motherNameBn = json['motherNameBn'];
    mobileNo = json['mobileNo'];
    phoneNo = json['phoneNo'];
    email = json['email'];
    fax = json['fax'];
    dob = json['dob'];
    nid = json['nid'];
    genderId = json['genderId'];
    genderName = json['genderName'];
    bloodGroupId = json['bloodGroupId'];
    bloodGroupName = json['bloodGroupName'];
    maritalStatusId = json['maritalStatusId'];
    maritalStatusName = json['maritalStatusName'];
    religionId = json['religionId'];
    religionName = json['religionName'];
    nationalityId = json['nationalityId'];
    nationalityName = json['nationalityName'];
    presentCareOf = json['presentCareOf'];
    presentVillageHouse = json['presentVillageHouse'];
    presentDistrictId = json['presentDistrictId'];
    presentDistrictName = json['presentDistrictName'];
    presentUpazilaId = json['presentUpazilaId'];
    presentUpazilaName = json['presentUpazilaName'];
    presentPostCode = json['presentPostCode'];
    parmanentCareOf = json['parmanentCareOf'];
    parmanentVillageHouse = json['parmanentVillageHouse'];
    permanentDistrictId = json['permanentDistrictId'];
    permanentDistrictName = json['permanentDistrictName'];
    permanentUpazilaId = json['permanentUpazilaId'];
    permanentUpazilaName = json['permanentUpazilaName'];
    permanentPostCode = json['permanentPostCode'];
    freedomFighterIs = json['freedomFighterIs'];
    prlStartDate = json['prlStartDate'];
    prlEndDate = json['prlEndDate'];
    retiredDate = json['retiredDate'];
    appUserId = json['appUserId'];
    appUserName = json['appUserName'];
    confirmIs = json['confirmIs'];
    confirmBy = json['confirmBy'];
    confirmDate = json['confirmDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['impId'] = this.impId;
    data['imageFileLocation'] = this.imageFileLocation;
    data['imageFileName'] = this.imageFileName;
    data['name'] = this.name;
    data['nameBn'] = this.nameBn;
    data['fatherName'] = this.fatherName;
    data['fatherNameBn'] = this.fatherNameBn;
    data['motherName'] = this.motherName;
    data['motherNameBn'] = this.motherNameBn;
    data['mobileNo'] = this.mobileNo;
    data['phoneNo'] = this.phoneNo;
    data['email'] = this.email;
    data['fax'] = this.fax;
    data['dob'] = this.dob;
    data['nid'] = this.nid;
    data['genderId'] = this.genderId;
    data['genderName'] = this.genderName;
    data['bloodGroupId'] = this.bloodGroupId;
    data['bloodGroupName'] = this.bloodGroupName;
    data['maritalStatusId'] = this.maritalStatusId;
    data['maritalStatusName'] = this.maritalStatusName;
    data['religionId'] = this.religionId;
    data['religionName'] = this.religionName;
    data['nationalityId'] = this.nationalityId;
    data['nationalityName'] = this.nationalityName;
    data['presentCareOf'] = this.presentCareOf;
    data['presentVillageHouse'] = this.presentVillageHouse;
    data['presentDistrictId'] = this.presentDistrictId;
    data['presentDistrictName'] = this.presentDistrictName;
    data['presentUpazilaId'] = this.presentUpazilaId;
    data['presentUpazilaName'] = this.presentUpazilaName;
    data['presentPostCode'] = this.presentPostCode;
    data['parmanentCareOf'] = this.parmanentCareOf;
    data['parmanentVillageHouse'] = this.parmanentVillageHouse;
    data['permanentDistrictId'] = this.permanentDistrictId;
    data['permanentDistrictName'] = this.permanentDistrictName;
    data['permanentUpazilaId'] = this.permanentUpazilaId;
    data['permanentUpazilaName'] = this.permanentUpazilaName;
    data['permanentPostCode'] = this.permanentPostCode;
    data['freedomFighterIs'] = this.freedomFighterIs;
    data['prlStartDate'] = this.prlStartDate;
    data['prlEndDate'] = this.prlEndDate;
    data['retiredDate'] = this.retiredDate;
    data['appUserId'] = this.appUserId;
    data['appUserName'] = this.appUserName;
    data['confirmIs'] = this.confirmIs;
    data['confirmBy'] = this.confirmBy;
    data['confirmDate'] = this.confirmDate;
    return data;
  }
}