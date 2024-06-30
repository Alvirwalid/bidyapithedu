class ApiPath {
  static const String baseUrl = 'http://deploy.bidyapithedu.com:9901/';
  static const String baseUrlImage = '';

  ////////// Dash board////////////
  static const String urlDashboardData = '';

  ////////// Auth ////////////////////
  static const String urlLogin = 'api/auth/signin';
  static const String urlGetUserByName = 'api/public/sya/app-user/get-user-by-name/';
  static const String urlGetOTP = 'api/public/sya/mail-sender/send-mail-for-otp/';
  static const String urlSignUp = 'api/public/sya/app-user';


  ///////////// EMP INFO //////////////
  static const String urlGetUserInfo = 'api/private/admin/emp-info/get-by-app-user-id';

  //////// SETUP SETUP DETAILS ///////////////

  static const String urlGetDropDownListByDevCode = 'api/private/common/setup-details/get-by-dev-code/';
  static const String urlGetDropDownListByDevCodeAndParentID = 'api/private/common/setup-details/get-by-dev-code-and-parent-id/';
  static const String urlGetOfficeDropDownList = 'api/private/common/setup-details/get-office-dropdown-list';
  static const String urlGetDesignationDropDownList = 'api/private/common/setup-details/get-designation-by-office-id/';

  //////////// SAVE EMP INFO /////////////
  static const String urlSavePersonalInfo = 'api/private/admin/emp-info';

  //////////// SAVE EMP OFFICIAL INFO /////////////
  static const String urlSaveOfficialInfo = 'api/private/admin/emp-office-info';




}
