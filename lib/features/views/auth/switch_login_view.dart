import 'dart:ffi';

import 'package:bidyapithedu/features/views/employee/add_employeeInfo_page.dart';
import 'package:bidyapithedu/features/views/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../shared_components/custom_widget/info_review_dialog_page.dart';
import '../../controller/auth_controller.dart';
import '../main_page.dart';
import 'login_page.dart';

class SwitchLoginPage extends GetView<AuthController> {
  const SwitchLoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      init: AuthController(),
      builder: (_) {



        if (_.isLogging.isTrue) {

          // print('isLoginnnnnnnnnnnnnnnnnnnnnn ${_.isLogging.isTrue}');
          return const LoginPage();
          if(_.isSaveEmpInfo.isTrue){
            print('isSaveEmpInfo ${_.isSaveEmpInfo.isTrue}');

           if(_.isConfirm.isTrue){
             print('isConfirm ${_.isSaveEmpInfo.isTrue}');
            return  InfoReviewDialogPage();
          }else{
             return AddEmployeeInfoPage();
           }
          }
          else{
            return  HomePage();
          }



        } else {
          return const LoginPage();
        }
      },
    );
  }



}