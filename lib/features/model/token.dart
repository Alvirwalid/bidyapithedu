import 'package:hive/hive.dart';

part 'token.g.dart';
@HiveType(typeId: 1)
class Token {
  @HiveField(0)
  bool? status;
  @HiveField(1)
  String? message;
  @HiveField(2)
  String? messageBn;
  @HiveField(3)
  Data? data;

  Token({this.status, this.message, this.messageBn, this.data});

  Token.fromJson(Map<String, dynamic> json) {
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
@HiveType(typeId: 2)
class Data {
  @HiveField(0)
  String? token;
  @HiveField(1)
  PasswordPolicy? passwordPolicy;

  Data({this.token, this.passwordPolicy});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    passwordPolicy = json['passwordPolicy'] != null
        ? new PasswordPolicy.fromJson(json['passwordPolicy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.passwordPolicy != null) {
      data['passwordPolicy'] = this.passwordPolicy!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 3)
class PasswordPolicy {
  @HiveField(0)
  int? id;
  @HiveField(1)
  bool? active;
  @HiveField(2)
  String? name;
  @HiveField(3)
  int? minLength;
  @HiveField(4)
  bool? sequential;
  @HiveField(5)
  bool? specialChar;
  @HiveField(6)
  bool? alphanumeric;
  @HiveField(7)
  bool? upperLower;
  @HiveField(8)
  bool? matchUsername;
  @HiveField(9)
  String? passwordRemember;
  @HiveField(10)
  int? passwordAge;
  @HiveField(11)
  int? devCode;

  PasswordPolicy(
      {this.id,
        this.active,
        this.name,
        this.minLength,
        this.sequential,
        this.specialChar,
        this.alphanumeric,
        this.upperLower,
        this.matchUsername,
        this.passwordRemember,
        this.passwordAge,
        this.devCode});

  PasswordPolicy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    name = json['name'];
    minLength = json['minLength'];
    sequential = json['sequential'];
    specialChar = json['specialChar'];
    alphanumeric = json['alphanumeric'];
    upperLower = json['upperLower'];
    matchUsername = json['matchUsername'];
    passwordRemember = json['passwordRemember'];
    passwordAge = json['passwordAge'];
    devCode = json['devCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['name'] = this.name;
    data['minLength'] = this.minLength;
    data['sequential'] = this.sequential;
    data['specialChar'] = this.specialChar;
    data['alphanumeric'] = this.alphanumeric;
    data['upperLower'] = this.upperLower;
    data['matchUsername'] = this.matchUsername;
    data['passwordRemember'] = this.passwordRemember;
    data['passwordAge'] = this.passwordAge;
    data['devCode'] = this.devCode;
    return data;
  }
}



