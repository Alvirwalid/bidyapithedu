import 'package:bidyapithedu/features/views/employee/add_employeeInfo_page.dart';
import 'package:bidyapithedu/features/views/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
          return  AddEmployeeInfoPage();
        } else {
          return const LoginPage();
        }
      },
    );
  }



}