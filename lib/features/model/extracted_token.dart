class ExtractedToken {
  var sub;
  var id;
  var exp;
  UserInfo? userInfo;

  ExtractedToken({this.sub, this.id, this.exp, this.userInfo});

  ExtractedToken.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    id = json['id'];
    exp = json['exp'];
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub'] = this.sub;
    data['id'] = this.id;
    data['exp'] = this.exp;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo!.toJson();
    }
    return data;
  }
}

class UserInfo {
  var id;
  var name;
  var banglaName;
  var active;
  var passwordPolicyId;
  var passwordPolicyName;
  var username;
  var password;
  var displayName;
  var email;
  var mobile;
  var userTypeId;
  var userTypeName;
  var otp;
  var nidOrBcNo;
  var zoneId;
  var zoneName;
  var wordId;
  var wordName;
  var areaId;
  var areaName;
  var roadId;
  var roadName;
  var holdingId;
  var holdingName;
  var address;
  var profileName;
  var profileLocation;

  UserInfo(
      {this.id,
        this.name,
        this.banglaName,
        this.active,
        this.passwordPolicyId,
        this.passwordPolicyName,
        this.username,
        this.password,
        this.displayName,
        this.email,
        this.mobile,
        this.userTypeId,
        this.userTypeName,
        this.otp,
        this.nidOrBcNo,
        this.zoneId,
        this.zoneName,
        this.wordId,
        this.wordName,
        this.areaId,
        this.areaName,
        this.roadId,
        this.roadName,
        this.holdingId,
        this.holdingName,
        this.address,
        this.profileName,
        this.profileLocation});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    banglaName = json['banglaName'];
    active = json['active'];
    passwordPolicyId = json['passwordPolicyId'];
    passwordPolicyName = json['passwordPolicyName'];
    username = json['username'];
    password = json['password'];
    displayName = json['displayName'];
    email = json['email'];
    mobile = json['mobile'];
    userTypeId = json['userTypeId'];
    userTypeName = json['userTypeName'];
    otp = json['otp'];
    nidOrBcNo = json['nidOrBcNo'];
    zoneId = json['zoneId'];
    zoneName = json['zoneName'];
    wordId = json['wordId'];
    wordName = json['wordName'];
    areaId = json['areaId'];
    areaName = json['areaName'];
    roadId = json['roadId'];
    roadName = json['roadName'];
    holdingId = json['holdingId'];
    holdingName = json['holdingName'];
    address = json['address'];
    profileName = json['profileName'];
    profileLocation = json['profileLocation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['banglaName'] = this.banglaName;
    data['active'] = this.active;
    data['passwordPolicyId'] = this.passwordPolicyId;
    data['passwordPolicyName'] = this.passwordPolicyName;
    data['username'] = this.username;
    data['password'] = this.password;
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['userTypeId'] = this.userTypeId;
    data['userTypeName'] = this.userTypeName;
    data['otp'] = this.otp;
    data['nidOrBcNo'] = this.nidOrBcNo;
    data['zoneId'] = this.zoneId;
    data['zoneName'] = this.zoneName;
    data['wordId'] = this.wordId;
    data['wordName'] = this.wordName;
    data['areaId'] = this.areaId;
    data['areaName'] = this.areaName;
    data['roadId'] = this.roadId;
    data['roadName'] = this.roadName;
    data['holdingId'] = this.holdingId;
    data['holdingName'] = this.holdingName;
    data['address'] = this.address;
    data['profileName'] = this.profileName;
    data['profileLocation'] = this.profileLocation;
    return data;
  }
}