class SignUpModel {
  bool? status;
  String? message;
  String? messageBn;
  Data? data;

  SignUpModel({this.status, this.message, this.messageBn, this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
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
  int? passwordPolicyId;
  String? passwordPolicyName;
  String? username;
  Null? password;
  String? displayName;
  String? email;
  String? mobile;
  String? designation;
  int? userTypeId;
  String? userTypeName;

  Data(
      {this.id,
        this.active,
        this.passwordPolicyId,
        this.passwordPolicyName,
        this.username,
        this.password,
        this.displayName,
        this.email,
        this.mobile,
        this.designation,
        this.userTypeId,
        this.userTypeName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    passwordPolicyId = json['passwordPolicyId'];
    passwordPolicyName = json['passwordPolicyName'];
    username = json['username'];
    password = json['password'];
    displayName = json['displayName'];
    email = json['email'];
    mobile = json['mobile'];
    designation = json['designation'];
    userTypeId = json['userTypeId'];
    userTypeName = json['userTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['passwordPolicyId'] = this.passwordPolicyId;
    data['passwordPolicyName'] = this.passwordPolicyName;
    data['username'] = this.username;
    data['password'] = this.password;
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['designation'] = this.designation;
    data['userTypeId'] = this.userTypeId;
    data['userTypeName'] = this.userTypeName;
    return data;
  }
}