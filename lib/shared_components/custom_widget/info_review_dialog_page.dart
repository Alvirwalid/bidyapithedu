
import 'package:bidyapithedu/constants/color_path.dart';
import 'package:bidyapithedu/features/controller/auth_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/other_constant.dart';
import '../custom_style.dart';

class InfoReviewDialogPage extends StatelessWidget {
   InfoReviewDialogPage({super.key});
             final _authController=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorPath.kWhite,
      appBar: AppBar(backgroundColor: ColorPath.kPrimaryColor,
        
        leading: GestureDetector(
          onTap: () {

            _authController.signOut();

          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(Icons.logout,color: ColorPath.kWhite,),
          ),
        ),
        
        
        title:Text("In Review",style: CustomStyle.kCustomTextStyle(color: ColorPath.kWhite,fontSize: OtherConstant.kLargeTextSize),),


      ),

      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(OtherConstant.kLargePadding),
        children: [


          Padding(
            padding:  EdgeInsets.only(top: 250),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:  OtherConstant.kLargePadding,vertical: OtherConstant.kLargePadding*2),
                decoration: BoxDecoration(
                  color: ColorPath.kBlueLight,
                  borderRadius: BorderRadius.circular(OtherConstant.kRegularRadius)
                ),
                child: Text('Your Information is under Review \nPlease inform your office colleague \nto confirm your information.',
                  style: CustomStyle.kCustomTextStyle(
                    fontSize:OtherConstant.kRegularTextSize,color: ColorPath.kWhite
                ),),
              ),
            ),
          )

        ],
      ),




    );
  }
}
