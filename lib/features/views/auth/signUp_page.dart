import 'package:animate_do/animate_do.dart';
import 'package:bidyapithedu/constants/other_constant.dart';
import 'package:bidyapithedu/features/controller/auth_controller.dart';
import 'package:bidyapithedu/shared_components/custom_widget/custom_textfield.dart';
import 'package:bidyapithedu/shared_components/custom_widget/custom_widgets.dart';
import 'package:bidyapithedu/utils/ui/custom_loading.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../constants/color_path.dart';
import '../../../constants/local_string.dart';
import '../../../shared_components/custom_widget/custom_button.dart';
import '../../../shared_components/custom_style.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _authController=Get.put(AuthController());
  final _formKey=GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      _authController.getUserByName(userName: _authController.mobileController.text);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _authController.nameController.clear();
    _authController.emailController.clear();
    // _authController.mobileController.clear();
    // _authController.passwordController.clear();
    _authController.confirmPasswordController.clear();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorPath.kWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leadingWidth: 100,
        leading:  Padding(
          padding: EdgeInsets.only(left: OtherConstant.kLargePadding),
          child: CustomButton.kBackButton(
              context: context,
              onPressed: () {
                Get.back();
              }),
        ),
      ),
      body:ListView(
        padding: EdgeInsets.all(OtherConstant.kLargePadding),
        children: [
          Text(
            LocalString.REGISTRATION_BUTTON.tr,
            textAlign: TextAlign.center,
            style: CustomStyle.kCustomTextStyle(
                fontSize: OtherConstant.kHeadlineTextSize,
                color: ColorPath.kBlack,
                fontWeight: FontWeight.w700),
          ),
          Text(
            LocalString.SIGN_UP_DESCRIPTION.tr,
            textAlign: TextAlign.center,
            style: CustomStyle.kCustomTextStyle(
                fontSize: OtherConstant.kMediumTextSize,
                color: ColorPath.kColorGrey3),
          ),
          SizedBox(height: OtherConstant.kLargePadding,),
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name',style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w600),),
                  SizedBox(height: OtherConstant.kSmallPadding,),
                  CustomTextField.kCustomTextField(
                    controller: _authController.nameController,
                    hint: LocalString.name.tr,
                    fillColor: ColorPath.kWhite,
                    validator: (val) =>val!.isEmpty?"Enter Name":null,
                    onChanged: (val) {

                    },
                  ),
                  SizedBox(height: OtherConstant.kLargePadding,),
                  Text('Email',style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w600),),
                  SizedBox(height: OtherConstant.kSmallPadding,),
                  CustomTextField.kCustomTextField(
                    controller: _authController.emailController,
                    hint: LocalString.email.tr,
                    fillColor: ColorPath.kWhite,
                    validator: (val) =>_validateEmail(val.toString()),
                    onChanged: (val) {

                    },
                  ),
                  SizedBox(height: OtherConstant.kLargePadding,),
                  Text('Mobile as Username',style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w600),),
                  SizedBox(height: OtherConstant.kSmallPadding,),
                  Obx((){
                    print(_authController.isUserNameValid.value);
                    return CustomTextField.kCustomTextField(
                      focusNode: _focusNode,
                      controller: _authController.mobileController,
                      hint: '+8801710531214',
                      validator: (val) => validateNumber(),
                      onChanged: (val) {

                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      fillColor: ColorPath.kWhite,


                    );
                  }

                  ),
                  SizedBox(height: OtherConstant.kLargePadding,),
                  Text('Password',style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w600),),
                  SizedBox(height: OtherConstant.kSmallPadding,),
                  Obx(() => CustomTextField.kCustomTextField(
                      contentPadding: EdgeInsets.only(left: 8,top: 4),
                      hint: 'Password',
                      fillColor: ColorPath.kWhite,
                      controller: _authController.passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length<6) {
                          return 'Password minimum 6 digit';
                        }else if (value.length > 15) {
                          return "Exceeded password limit";
                        }
                        return null;
                      },
                      suffixIcon:InkWell(
                        onTap: () {
                          _authController
                              .passwordVisibility();
                        },
                        child: Icon(_authController
                            .showPass.isFalse
                            ? FeatherIcons.eye
                            : FeatherIcons.eyeOff,
                          size: OtherConstant.kLargePadding,),
                      ),
                      obscureText: _authController.showPass.value
                  )),

                  SizedBox(height: OtherConstant.kLargePadding,),
                  Text('Confirm Password',style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w600),),
                  SizedBox(height: OtherConstant.kSmallPadding,),
                  Obx(
                        () => CustomTextField.kCustomTextField(
                        hint: '********',
                        controller:
                        _authController.confirmPasswordController,
                        onChanged: (value) {

                        },
                        validator: passwordValidator,
                        // (value) => value.isEmpty || value.toString().length < 6 ? LocalString.validPassword : null,
                        obscureText:
                        !_authController.isConfirmPasswordVisible.value,
                        suffixIcon: InkWell(
                            onTap: () {
                              _authController.confirmPasswordVisibility();
                            },
                            child:  Icon(_authController
                                .isConfirmPasswordVisible.value
                                ?
                            FeatherIcons.eye:FeatherIcons.eyeOff,
                              size:  OtherConstant.kLargePadding,
                            )


                        ),
                        fillColor: ColorPath.kWhite
                    ),
                  ),

                  SizedBox(height: 20),
                CustomButton.customButton(
                    onTap:() {
                      if(_formKey.currentState!.validate()){

                        _authController.getOTP(email: _authController.emailController.text,name: _authController.nameController.text);
                      }else{


                      }
                  },
                    text: 'Sign Up'
                  ),

                ],
              ))


        ],
      ),
    );

  }

  String? validateNumber(){
   _authController.getUserByName(userName: _authController.mobileController.text);
    if(_authController.mobileController.text.toString().length>=11){

      if(_authController.isUserNameValid.isTrue){
        return null;
      }else{
        return 'Mobile No. already used';
      }




    }else{
      return 'Enter Valid Number';
    }



  }
  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    }
    // Regex for email validation
    String emailPattern = r"^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*";
    RegExp regex = RegExp(emailPattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }
  String? passwordValidator(value) {
    if (_authController.confirmPasswordController.text != _authController.passwordController.text) {

      return LocalString.NOT_MATCH_PASSWORD.tr;
    } else {

      return null;
    }
  }
}
