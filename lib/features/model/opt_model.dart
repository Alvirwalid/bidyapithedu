class OTPModel {
  bool? status;
  String? message;
  String? messageBn;
  String? data;

  OTPModel({this.status, this.message, this.messageBn, this.data});

  OTPModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageBn = json['messageBn'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['messageBn'] = this.messageBn;
    data['data'] = this.data;
    return data;
  }
}