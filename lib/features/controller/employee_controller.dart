import 'dart:convert';
import 'dart:developer';

import 'package:bidyapithedu/constants/api_path.dart';
import 'package:bidyapithedu/constants/app_utils.dart';
import 'package:bidyapithedu/constants/color_path.dart';
import 'package:bidyapithedu/features/controller/user_controller.dart';
import 'package:bidyapithedu/features/model/blood_group_model.dart';
import 'package:bidyapithedu/features/model/employee_info_for_save_model.dart';
import 'package:bidyapithedu/features/model/extracted_token.dart';
import 'package:bidyapithedu/features/model/gender_dropdown_model.dart';
import 'package:bidyapithedu/features/model/marital_status_dropdowns_model.dart';
import 'package:bidyapithedu/features/model/office_dropdown_model.dart';
import 'package:bidyapithedu/features/model/religion_dropdowns_model.dart';
import 'package:bidyapithedu/utils/service/api_request.dart';
import 'package:bidyapithedu/utils/ui/custom_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../constants/local_string.dart';
import '../model/basic_employee_info.dart';
import '../model/batch_dropdown_model.dart';
import '../model/department_dropdown_list.dart';
import '../model/designation_dropdownList_model.dart';
import '../model/employee_dropdownLis_model.dart';
import '../model/token.dart';

class EmployeeController extends GetxController{

  final UserController _userController = Get.put(UserController());



  ///////////////// Basic Text Controller ////////////////


  TextEditingController employeeIDController=TextEditingController();
  TextEditingController employeeNameController=TextEditingController();
  TextEditingController employeeBanglaNameController=TextEditingController();
  TextEditingController fatherNameController=TextEditingController();
  TextEditingController fatherNameBanglaController=TextEditingController();
  TextEditingController motherNameController=TextEditingController();
  TextEditingController motherNamebanglaController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController nidController=TextEditingController();
  TextEditingController faxController=TextEditingController();
  TextEditingController dobController=TextEditingController();
  TextEditingController genderController=TextEditingController();
  TextEditingController genderNameController=TextEditingController();
  TextEditingController bloodGroupController=TextEditingController();
  TextEditingController maritalStatusController=TextEditingController();
  TextEditingController religionController=TextEditingController();

  ///////////////// Employment Text Controller ////////////////
  TextEditingController employeeTypeIdController=TextEditingController();
  TextEditingController batchIdController=TextEditingController();
  TextEditingController officeIDController=TextEditingController();
  TextEditingController designationIDController=TextEditingController();
  TextEditingController departmentIDController=TextEditingController();
  TextEditingController employeeOfficialPhoneController=TextEditingController();
  TextEditingController employeeOfficialEmailController=TextEditingController();
  TextEditingController joiningDateController=TextEditingController();
  TextEditingController prlStartDateDateController=TextEditingController();
  TextEditingController prlEndDateDateController=TextEditingController();
  TextEditingController retiredDateController=TextEditingController();

  ////////// DropDown ////////////
  Rx<GenderDropdownListModel>genderDropDownList=Rx(GenderDropdownListModel());
  Rx<BloodGroupModel>bloodGroupDropDownList=Rx(BloodGroupModel());
  Rx<MaritalStatusDropdownListModel>maritalStatusDropDownList=Rx(MaritalStatusDropdownListModel());
  Rx<ReligionDropdownListModel>religionDropDownList=Rx(ReligionDropdownListModel());
  Rx<EmployeeDropdownListModel>employeeDropDownList=Rx(EmployeeDropdownListModel());
  Rx<BatchDropDownModel>batchDropDownList=Rx(BatchDropDownModel());
  Rx<DesignationDropDownModel>designationDropDownList=Rx(DesignationDropDownModel());
  Rx<DepartmentDropDownModel>departmentDropDownList=Rx(DepartmentDropDownModel());
  Rx<OfficeDropDownModel>officeDropDownList=Rx(OfficeDropDownModel());



  //////////////// Model ////////////////
  Rx<BasicEmployeeInfoModel>basicEmployeeModel=Rx(BasicEmployeeInfoModel());
  Rx<EmployeeInfoSaveModel>employeeInfoForSave=Rx(EmployeeInfoSaveModel());



  final box = GetStorage();
  RxBool isDataLoaded=RxBool(false);
  RxBool isCheckFreedomFighter=RxBool(false);
  RxBool isSaveBasicInfo=RxBool(false);


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getGender();
    getBloodGroup();
    getMaritalStatus();
    getReligion();
    getOffice();
    getEmployeeType();
    getDepartment();

  }


  Future<bool> saveBasicInfo() async {
    CustomLoading.loadingDialog();
    var body = jsonEncode({
      "impId": employeeIDController.text,
      "imageFileLocation": "",
      "imageFileName": "",
      "name": employeeNameController.text,
      "nameBn": employeeBanglaNameController.text,
      "fatherName": fatherNameController.text,
      "fatherNameBn": fatherNameBanglaController.text,
      "motherNameBn": motherNamebanglaController.text,
      "mobileNo": mobileController.text,
      "phoneNo": phoneController.text,
      "email": emailController.text,
      "fax": faxController.text,
      "dob": dobController.text,
      "nid": nidController.text,
      "genderId": genderController.text,
      "bloodGroupId": bloodGroupController.text,
      "bloodGroupName": "",
      "maritalStatusId": maritalStatusController.text,
      "maritalStatusName": "",
      "religionId": religionController.text,
      "religionName": "",
      "appUserId":box.read(LocalString.appUserID),
      "freedomFighterIs": isCheckFreedomFighter.value,
    });

    ApiRequest apiRequest = ApiRequest(url: ApiPath.urlSavePersonalInfo, body: body);

    try {
      var res = await apiRequest.postRequestWithAuth();
      isDataLoaded.value = false;
      log(res!.body);
      Get.back();
      Get.back();
      if (res!.statusCode == 200) {

        basicEmployeeModel.value = BasicEmployeeInfoModel.fromJson(jsonDecode(res.body));
        if (basicEmployeeModel.value.status == true) {
          return true;
        } else {
          Fluttertoast.showToast(msg:basicEmployeeModel.value.message.toString() , backgroundColor: ColorPath.kRed);
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString(), backgroundColor: ColorPath.kRed);
      return false;
    }

  }


  Future<bool> saveEmployeeInfo() async {

    var body = jsonEncode(

        {
          "empPersonalInfoId": basicEmployeeModel.value.data?.id,
          "empTypeId": int.parse(employeeTypeIdController.text),
          "batchId": int.parse(batchIdController.text),
          "designationId": int.parse(designationIDController.text),
          "gradeId": null,
          "departmentId": int.parse(departmentIDController.text),
          "officeId": int.parse(officeIDController.text),
          "empOfficialPhone":employeeOfficialPhoneController.text.toString(),
          "empOfficialEmail": employeeOfficialEmailController.text.toString(),
          "joiningDate": joiningDateController.text.toString(),
        }

    );

    log(body);

    ApiRequest apiRequest = ApiRequest(url: ApiPath.urlSaveOfficialInfo, body: body);

    try {
      var res = await apiRequest.postRequestWithAuth();

      isDataLoaded.value = false;
      Get.back();

      if (res!.statusCode == 200) {

        employeeInfoForSave.value = EmployeeInfoSaveModel.fromJson(jsonDecode(utf8.decode(res.bodyBytes)));

        if (employeeInfoForSave.value.status == true) {
          return true;
        } else {
          Fluttertoast.showToast(msg:employeeInfoForSave.value.message.toString() , backgroundColor: ColorPath.kRed);
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString(), backgroundColor: ColorPath.kRed);
      return false;
    }

  }


  getGender(){
    ApiRequest apiRequest=ApiRequest(url: ApiPath.urlGetDropDownListByDevCode+AppUtils.genderID.toString());
    apiRequest.getRequestWithAuth().then((res){
    if(res!.statusCode==200){
      genderDropDownList.value=GenderDropdownListModel.fromJson(jsonDecode(res.body));
    }
    }).catchError((e){
      print(e.toString());
    });
  }

  getBloodGroup(){
    ApiRequest apiRequest=ApiRequest(url: ApiPath.urlGetDropDownListByDevCode+AppUtils.bloodGroupID.toString());
    apiRequest.getRequestWithAuth().then((res){

      if(res!.statusCode==200){
        bloodGroupDropDownList.value=BloodGroupModel.fromJson(jsonDecode(res.body));
      }
    }).catchError((e){
      print(e.toString());
    });
  }

  getMaritalStatus(){
    ApiRequest apiRequest=ApiRequest(url: ApiPath.urlGetDropDownListByDevCode+AppUtils.maritalStatusID.toString());
    apiRequest.getRequestWithAuth().then((res){
      if(res!.statusCode==200){
        maritalStatusDropDownList.value=MaritalStatusDropdownListModel.fromJson(jsonDecode(res.body));
      }
    }).catchError((e){
      print(e.toString());
    });
  }
  getReligion(){
    ApiRequest apiRequest=ApiRequest(url: ApiPath.urlGetDropDownListByDevCode+AppUtils.religionID.toString());
    apiRequest.getRequestWithAuth().then((res){
      if(res!.statusCode==200){
        religionDropDownList.value=ReligionDropdownListModel.fromJson(jsonDecode(res.body));
      }
    }).catchError((e){
      print(e.toString());
    });
  }

  getEmployeeType(){
    ApiRequest apiRequest=ApiRequest(url: ApiPath.urlGetDropDownListByDevCode+AppUtils.employeeTypeID.toString());
    apiRequest.getRequestWithAuth().then((res){
      if(res!.statusCode==200){
        employeeDropDownList.value=EmployeeDropdownListModel.fromJson(jsonDecode(res.body));
      }
    }).catchError((e){
      print(e.toString());
    });
  }
  getOffice(){
    ApiRequest apiRequest=ApiRequest(url: ApiPath.urlGetOfficeDropDownList);
    apiRequest.getRequestWithAuth().then((res){
      if(res!.statusCode==200){
        officeDropDownList.value=OfficeDropDownModel.fromJson(jsonDecode(res.body));
      }
    }).catchError((e){
      print(e.toString());
    });
  }

  getDesignation({empId}){

    ApiRequest apiRequest=ApiRequest(url: ApiPath.urlGetDesignationDropDownList+'${int.parse(empId)}');
    apiRequest.getRequestWithAuth().then((res){
      if(res!.statusCode==200){
        designationDropDownList.value=DesignationDropDownModel.fromJson(jsonDecode(res.body));
      }
    }).catchError((e){
      print(e.toString());
    });
  }

  getBatch({empTypeId}){

    print(AppUtils.batchID.runtimeType);
    print(empTypeId.runtimeType);
    ApiRequest apiRequest=ApiRequest(url: '${ApiPath.urlGetDropDownListByDevCodeAndParentID}${AppUtils.batchID}/${int.parse(empTypeId)}');
    apiRequest.getRequestWithAuth().then((res){
      log(res!.body);
      if(res!.statusCode==200){
        batchDropDownList.value=BatchDropDownModel.fromJson(jsonDecode(res.body));
      }
    }).catchError((e){
      print(e.toString());
    });
  }

  getDepartment(){
    ApiRequest apiRequest=ApiRequest(url: '${ApiPath.urlGetDropDownListByDevCode}${AppUtils.departmentID}');
    apiRequest.getRequestWithAuth().then((res){
      if(res!.statusCode==200){
        departmentDropDownList.value=DepartmentDropDownModel.fromJson(jsonDecode(res.body));
      }
    }).catchError((e){
      print(e.toString());
    });
  }



}