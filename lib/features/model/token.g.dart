// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokenAdapter extends TypeAdapter<Token> {
  @override
  final int typeId = 1;

  @override
  Token read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Token(
      status: fields[0] as bool?,
      message: fields[1] as String?,
      messageBn: fields[2] as String?,
      data: fields[3] as Data?,
    );
  }

  @override
  void write(BinaryWriter writer, Token obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.messageBn)
      ..writeByte(3)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 2;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      token: fields[0] as String?,
      passwordPolicy: fields[1] as PasswordPolicy?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.passwordPolicy);
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

class PasswordPolicyAdapter extends TypeAdapter<PasswordPolicy> {
  @override
  final int typeId = 3;

  @override
  PasswordPolicy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PasswordPolicy(
      id: fields[0] as int?,
      active: fields[1] as bool?,
      name: fields[2] as String?,
      minLength: fields[3] as int?,
      sequential: fields[4] as bool?,
      specialChar: fields[5] as bool?,
      alphanumeric: fields[6] as bool?,
      upperLower: fields[7] as bool?,
      matchUsername: fields[8] as bool?,
      passwordRemember: fields[9] as String?,
      passwordAge: fields[10] as int?,
      devCode: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PasswordPolicy obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.active)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.minLength)
      ..writeByte(4)
      ..write(obj.sequential)
      ..writeByte(5)
      ..write(obj.specialChar)
      ..writeByte(6)
      ..write(obj.alphanumeric)
      ..writeByte(7)
      ..write(obj.upperLower)
      ..writeByte(8)
      ..write(obj.matchUsername)
      ..writeByte(9)
      ..write(obj.passwordRemember)
      ..writeByte(10)
      ..write(obj.passwordAge)
      ..writeByte(11)
      ..write(obj.devCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordPolicyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
