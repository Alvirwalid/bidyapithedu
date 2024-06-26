import 'dart:async';

import 'package:bidyapithedu/constants/color_path.dart';
import 'package:bidyapithedu/features/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/asset_path.dart';
import '../../../constants/local_string.dart';
import '../../../constants/other_constant.dart';
import '../../../shared_components/custom_style.dart';
import '../../../shared_components/custom_widget/custom_button.dart';
import '../../../shared_components/custom_widget/custom_textfield.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final _authController=Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  FocusNode textFirstFocusNode = FocusNode();

  FocusNode textSecondFocusNode = FocusNode();

  FocusNode textThirdFocusNode = FocusNode();

  FocusNode textForthFocusNode = FocusNode();

  int _start = 30;

  Timer? _timer;

  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
    _authController.otp1.clear();
    _authController.otp2.clear();
    _authController.otp3.clear();
    _authController.otp4.clear();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
        Get.back();
      } else {
        setState(() {
          _start--;
        });
      }
    });
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
      body: Center(
        child: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (_) {
            return Padding(
              padding:  EdgeInsets.all(OtherConstant.kLargePadding+4),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetPath.kabout),
                    Padding(
                      padding: EdgeInsets.all(OtherConstant.kRegularPadding),
                      child: Text(
                        LocalString.OTP.tr,
                        style: CustomStyle.kCustomTextStyle(
                            fontSize: OtherConstant.kHeadlineTextSize,
                            color: ColorPath.kBlack,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: OtherConstant.kLargePadding),
                      child: Text(
                        LocalString.OTP_DESCRIPTION.tr
                        ,textAlign: TextAlign.center,
                        style: CustomStyle.kCustomTextStyle( color: ColorPath.kColorGrey3),
                      ),
                    ),
                    Row(

                      children:[
                        Expanded(
                          // child: Text('data'),
                          child: CustomTextField.kCustomOtpField(
                              focusNode: textFirstFocusNode,
                              controller: _.otp1,
                              onChanged: (val) {
                                FocusScope.of(context)
                                    .requestFocus(textSecondFocusNode);
                              }),
                        ),
                        SizedBox(
                          width: OtherConstant.kLargePadding,
                        ),
                        Expanded(
                          // child: Text('data'),
                          child: CustomTextField.kCustomOtpField(
                              focusNode: textSecondFocusNode,
                              controller: _.otp2,
                              onChanged: (val) {

                                FocusScope.of(context)
                                    .requestFocus(textThirdFocusNode);
                              }),
                        ),
                        SizedBox(
                          width: OtherConstant.kLargePadding,
                        ),
                        Expanded(
                          // child: Text('data'),
                          child: CustomTextField.kCustomOtpField(
                              focusNode: textThirdFocusNode,
                              controller: _.otp3,
                              onChanged: (val) {
                                FocusScope.of(context)
                                    .requestFocus(textForthFocusNode);
                              }),
                        ),
                        SizedBox(
                          width: OtherConstant.kLargePadding,
                        ),
                        Expanded(
                          // child: Text('data'),
                          child: CustomTextField.kCustomOtpField(
                              focusNode: textForthFocusNode,
                              controller: _.otp4,
                              onChanged: (val) {
                                FocusScope.of(context).unfocus();
                              }),
                        ),
                      ],
                    ),
                    SizedBox(height: OtherConstant.kLargePadding,),

                    CustomButton.customButton(
                      onTap: () {
                        if(_formKey.currentState!.validate()){
                          _.verifyingOTP();
                        }
                      },
                       text:  LocalString.submit.tr,
                    ),
                    SizedBox(height: OtherConstant.kLargePadding,),
                    Text(
                      '$_start seconds remaining',
                      textAlign: TextAlign.center,
                      style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}
