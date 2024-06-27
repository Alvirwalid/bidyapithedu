import 'dart:convert';
import 'dart:developer';
import 'package:bidyapithedu/constants/color_path.dart';
import 'package:bidyapithedu/constants/other_constant.dart';
import 'package:bidyapithedu/features/model/opt_model.dart';
import 'package:bidyapithedu/features/views/auth/login_page.dart';
import 'package:bidyapithedu/features/views/employee/add_employeeInfo_page.dart';
import 'package:bidyapithedu/features/views/home_page.dart';
import 'package:bidyapithedu/utils/ui/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../confiq/routing/all_route.dart';
import '../../constants/api_path.dart';
import '../../constants/local_string.dart';
import '../../utils/service/api_request.dart';
import '../model/extracted_token.dart';
import '../model/sign_up_model.dart';
import '../model/token.dart';
import '../views/auth/otp_page.dart';
import '../views/main_page.dart';

class AuthController extends GetxController {
  RxBool showPass = RxBool(true);
  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();

  Rx<OTPModel> otpModel=Rx(OTPModel());
  Rx<SignUpModel> signUpModel=Rx(SignUpModel());



  final Box<Token> tokenBox = Hive.box<Token>(LocalString.TOKEN_BOX);
  final box = GetStorage();
  RxBool isLogging = RxBool(false);

  //// Password validator ////////
  RxBool isConfirmPasswordVisible = RxBool(false);
  RxBool isUserNameValid=RxBool(false);


  passwordVisibility() {
    showPass.value = !showPass.value;
  }

  confirmPasswordVisibility() {
    isConfirmPasswordVisible.value=!isConfirmPasswordVisible.value;
  }

  signOut() async {
    await tokenBox.clear();
    box.erase();
    Get.offAllNamed(AllRouters.LOGIN_PAGE);
  }

  login(){
    var body = jsonEncode({
      "password": passwordController.text,
      "username": mobileController.text
    });

    // print(body);
    ApiRequest request = ApiRequest(url: ApiPath.urlLogin, body: body);
    request.postRequest().then((res) {
      Get.back();
      if (res!.statusCode == 200) {
        Token token = Token.fromJson(jsonDecode(res.body));
        // log(res.body);
        if (token.status == true) {

          tokenBox.put('token', token);

          Map<String, dynamic> decodedToken = JwtDecoder.decode(token.data!.token.toString());

          ExtractedToken extractedToken = ExtractedToken.fromJson(decodedToken);

          getUser();

          // Get.offAll(() => const HomePage());

        } else {
          Get.back();
          Fluttertoast.showToast(msg: token.message.toString());
        }
      } else {
        Get.back();
        Fluttertoast.showToast(msg:LocalString.Oops_something_went_wrong.tr);
      }
    }).catchError((e) {
      Get.back();
      print(e);
    });
  }

  getUser() {
    ApiRequest request = ApiRequest(url: ApiPath.urlGetUserInfo);
    request.getRequestWithAuth().then((res) {
      log(res!.body);
      if (res!.statusCode == 200) {
        // user.UserInfo userInfo = user.UserInfo.fromJson(jsonDecode(utf8.decode(res.bodyBytes)));
        // userBox.put('userInfo', userInfo);

        if(jsonDecode(res.body)['data']==null){
          Get.offAll(()=>AddEmployeeInfoPage());
        }else{
          print('Dshboard');
        }


      } else {
        Get.back();
        Fluttertoast.showToast(msg: res.reasonPhrase.toString());
      }
    }).catchError((e) {
      Get.back();
      print(e);
    });
  }


  getUserByName({userName}){
    ApiRequest  apiRequest=ApiRequest(url: ApiPath.urlGetUserByName+userName.toString());
    apiRequest.getRequest().then((res){
     if(jsonDecode(res!.body)['data'] ==null){
       isUserNameValid.value=true;
     }else{
       isUserNameValid.value=false;
     }

    });

  }


  getOTP({email,name}){
    CustomLoading.loadingDialog();
    ApiRequest  apiRequest=ApiRequest(url: '${ApiPath.urlGetOTP}$email/$name');
    apiRequest.getRequest().then((res){
      Get.back();
      if(res!.statusCode == 200){
        otpModel.value = OTPModel.fromJson(jsonDecode(res.body));
        if(otpModel.value.data != null){
          otpController.text = otpModel.value.data!;
          Get.to(OTPPage());
        }else{
          Fluttertoast.showToast(msg: otpModel.value.message!);
        }
      }else{
        Fluttertoast.showToast(msg: LocalString.someError.tr);
      }

    }).catchError((e){
      Fluttertoast.showToast(msg: e.toString());
    }
    );

  }

  verifyingOTP(){
    CustomLoading.loadingDialog();
    var otp =int.parse(otp1.text + otp2.text + otp3.text+otp4.text) ;
    int responseOtp=int.parse(otpModel.value.data.toString());
    var  dividedOtp=(responseOtp/13).floor();
    // print(otp);
    // print(dividedOtp);
    if(otp==dividedOtp){
      Get.back();
      signUp();
    }else{
      Fluttertoast.showToast(msg:LocalString.otpValidationError,backgroundColor:ColorPath.kRed,fontSize:OtherConstant.kMediumTextSize);
      Get.back();
    }



  }

  signUp(){
    var body=jsonEncode(
        {
          "id": 0,
          "active": true,
          "passwordPolicyId": 0,
          "passwordPolicyName": "",
          "username": mobileController.text,
          "password": passwordController.text,
          "displayName": nameController.text,
          "email": emailController.text,
          "mobile": mobileController.text,
          "designation": "",
          "userTypeId": 2,
          "userTypeName": "User"
        }
    );

    ApiRequest apiRequest=ApiRequest(url: ApiPath.urlSignUp,body:body);
    apiRequest.postRequest(isLoadingScreen:false).then((res){

      log(res!.body);
      if(res!.statusCode==200){
        signUpModel.value=SignUpModel.fromJson(jsonDecode(utf8.decode(res.bodyBytes)));
        if(signUpModel.value.status==true){

          box.write("password", passwordController.text);
          box.write("username", mobileController.text);
          Get.offAll(()=>LoginPage());
        }else{
          Fluttertoast.showToast(msg: signUpModel.value.message.toString());
        }

      }

    }).catchError((e){
      // Fluttertoast.showToast(msg: e.toString());
    });
  }

/////////// Helper Method ///////////////



  Stream<bool> checkLogging() async* {
    var res = false;
    if (tokenBox.isEmpty) {
      res = false;
    } else {
      if (tokenBox.get('token')?.data?.token != null) {
        bool isExpired = JwtDecoder.isExpired('${tokenBox.get('token')?.data?.token!}');
        if(isExpired == true){
          res = false;
          signOut();
        }else{
          res = true;
        }

      }
    }
    yield res;
  }

  @override
  void onInit() {
    super.onInit();
    isLogging.bindStream(checkLogging());
  }
}
