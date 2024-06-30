// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeInfoAdapter extends TypeAdapter<EmployeeInfo> {
  @override
  final int typeId = 4;

  @override
  EmployeeInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeInfo(
      status: fields[1] as bool?,
      message: fields[2] as String?,
      messageBn: fields[3] as String?,
      data: fields[4] as Data?,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeInfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.messageBn)
      ..writeByte(4)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 5;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      id: fields[1] as int?,
      active: fields[2] as bool?,
      impId: fields[3] as String?,
      imageFileLocation: fields[4] as String?,
      imageFileName: fields[5] as String?,
      name: fields[6] as String?,
      nameBn: fields[7] as String?,
      fatherName: fields[8] as String?,
      fatherNameBn: fields[9] as String?,
      motherName: fields[10] as String?,
      motherNameBn: fields[11] as String?,
      mobileNo: fields[12] as String?,
      phoneNo: fields[13] as String?,
      email: fields[14] as String?,
      fax: fields[15] as String?,
      dob: fields[16] as String?,
      nid: fields[17] as String?,
      genderId: fields[18] as int?,
      genderName: fields[19] as String?,
      bloodGroupId: fields[20] as int?,
      bloodGroupName: fields[21] as String?,
      maritalStatusId: fields[22] as int?,
      maritalStatusName: fields[23] as String?,
      religionId: fields[24] as int?,
      religionName: fields[25] as String?,
      nationalityId: fields[26] as int?,
      nationalityName: fields[27] as String?,
      presentCareOf: fields[28] as String?,
      presentVillageHouse: fields[29] as String?,
      presentDistrictId: fields[30] as String?,
      presentDistrictName: fields[31] as String?,
      presentUpazilaId: fields[32] as int?,
      presentUpazilaName: fields[33] as String?,
      presentPostCode: fields[34] as String?,
      parmanentCareOf: fields[35] as String?,
      parmanentVillageHouse: fields[36] as String?,
      permanentDistrictId: fields[37] as int?,
      permanentDistrictName: fields[38] as String?,
      permanentUpazilaId: fields[39] as int?,
      permanentUpazilaName: fields[40] as String?,
      permanentPostCode: fields[41] as String?,
      freedomFighterIs: fields[42] as bool?,
      prlStartDate: fields[43] as String?,
      prlEndDate: fields[44] as String?,
      retiredDate: fields[45] as String?,
      appUserId: fields[46] as int?,
      appUserName: fields[47] as String?,
      confirmIs: fields[48] as bool?,
      confirmBy: fields[49] as String?,
      confirmDate: fields[50] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(50)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.active)
      ..writeByte(3)
      ..write(obj.impId)
      ..writeByte(4)
      ..write(obj.imageFileLocation)
      ..writeByte(5)
      ..write(obj.imageFileName)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.nameBn)
      ..writeByte(8)
      ..write(obj.fatherName)
      ..writeByte(9)
      ..write(obj.fatherNameBn)
      ..writeByte(10)
      ..write(obj.motherName)
      ..writeByte(11)
      ..write(obj.motherNameBn)
      ..writeByte(12)
      ..write(obj.mobileNo)
      ..writeByte(13)
      ..write(obj.phoneNo)
      ..writeByte(14)
      ..write(obj.email)
      ..writeByte(15)
      ..write(obj.fax)
      ..writeByte(16)
      ..write(obj.dob)
      ..writeByte(17)
      ..write(obj.nid)
      ..writeByte(18)
      ..write(obj.genderId)
      ..writeByte(19)
      ..write(obj.genderName)
      ..writeByte(20)
      ..write(obj.bloodGroupId)
      ..writeByte(21)
      ..write(obj.bloodGroupName)
      ..writeByte(22)
      ..write(obj.maritalStatusId)
      ..writeByte(23)
      ..write(obj.maritalStatusName)
      ..writeByte(24)
      ..write(obj.religionId)
      ..writeByte(25)
      ..write(obj.religionName)
      ..writeByte(26)
      ..write(obj.nationalityId)
      ..writeByte(27)
      ..write(obj.nationalityName)
      ..writeByte(28)
      ..write(obj.presentCareOf)
      ..writeByte(29)
      ..write(obj.presentVillageHouse)
      ..writeByte(30)
      ..write(obj.presentDistrictId)
      ..writeByte(31)
      ..write(obj.presentDistrictName)
      ..writeByte(32)
      ..write(obj.presentUpazilaId)
      ..writeByte(33)
      ..write(obj.presentUpazilaName)
      ..writeByte(34)
      ..write(obj.presentPostCode)
      ..writeByte(35)
      ..write(obj.parmanentCareOf)
      ..writeByte(36)
      ..write(obj.parmanentVillageHouse)
      ..writeByte(37)
      ..write(obj.permanentDistrictId)
      ..writeByte(38)
      ..write(obj.permanentDistrictName)
      ..writeByte(39)
      ..write(obj.permanentUpazilaId)
      ..writeByte(40)
      ..write(obj.permanentUpazilaName)
      ..writeByte(41)
      ..write(obj.permanentPostCode)
      ..writeByte(42)
      ..write(obj.freedomFighterIs)
      ..writeByte(43)
      ..write(obj.prlStartDate)
      ..writeByte(44)
      ..write(obj.prlEndDate)
      ..writeByte(45)
      ..write(obj.retiredDate)
      ..writeByte(46)
      ..write(obj.appUserId)
      ..writeByte(47)
      ..write(obj.appUserName)
      ..writeByte(48)
      ..write(obj.confirmIs)
      ..writeByte(49)
      ..write(obj.confirmBy)
      ..writeByte(50)
      ..write(obj.confirmDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
