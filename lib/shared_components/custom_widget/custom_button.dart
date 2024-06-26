import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/color_path.dart';
import '../../constants/local_string.dart';
import '../../constants/other_constant.dart';
import '../custom_style.dart';

class CustomButton {
  static SizedBox kCustomElevatedButtonWithIcon(
          {Color color = ColorPath.kAccentColor,
         required String title ,
           IconData? icon,
            MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
            Function()? onPressed,
            FontWeight? fontWeight = FontWeight.w400,
            double elevation = 0.0,
            Color fontColor = ColorPath.kGreyWhite,
            double? padding,
           double? iconSize,
          double? fontSize,
            String?asset,
            VisualDensity? visualDensity}) =>
      SizedBox(
          width: Size.infinite.width,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                visualDensity: visualDensity,
                backgroundColor: MaterialStateProperty.all(color),
                elevation: MaterialStateProperty.all(elevation),
                padding: MaterialStateProperty.all(
                    EdgeInsets.all(padding ?? OtherConstant.kLargePadding)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(OtherConstant.kRegularPadding)))),
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               asset!=null?Image.asset(asset,fit: BoxFit.contain,width:OtherConstant.kLargePadding,height: OtherConstant.kLargePadding) :Icon(
                  icon,
                  color: fontColor ,
                  size: iconSize?? OtherConstant.kVerySmallIconSize,
                ),
                SizedBox(width: OtherConstant.kRegularPadding),
                Text(
                  title,
                  style: CustomStyle.kCustomTextStyle(
                    fontSize: fontSize?? OtherConstant.kLargeTextSize,
                    fontWeight: fontWeight ?? FontWeight.w400,
                    color: fontColor ),),
              ],
            ),
          ));

  static SizedBox customElevatedButton(
          {required String? title,
          Function()? onPressed,
          EdgeInsets? textPadding,
          Color? textColor,
          double? elevation,
          BorderSide? side,
            fontSize,
          Color? backgroundColor}) =>
      SizedBox(
        width: Size.infinite.width,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  side: side ?? BorderSide.none,
                  borderRadius:
                      BorderRadius.circular(OtherConstant.kRegularPadding))),
              elevation: MaterialStatePropertyAll(elevation ?? 10.0),
              shadowColor: MaterialStatePropertyAll(ColorPath.kPrimaryColor),
              padding: MaterialStatePropertyAll(
                EdgeInsets.all(OtherConstant.kRegularPadding),
              ),
              backgroundColor: MaterialStatePropertyAll(
                  backgroundColor ?? ColorPath.kPrimaryColor),
            ),
            child: Padding(
              padding: textPadding ?? EdgeInsets.zero,
              child: Text(
                title!,
                style: CustomStyle.kCustomTextStyle(fontSize: fontSize,
                    color: textColor ?? ColorPath.kGreyWhite,
                    fontWeight: FontWeight.w700),
              ),
            )),
      );



  static  GestureDetector customButton({Function()?onTap,text}) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: OtherConstant.kMediumIconSize*1.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(OtherConstant.kRegularRadius),
            gradient: const LinearGradient(
                colors: [
                  ColorPath.kButtonColorGradient1,
                  ColorPath.kButtonColorGradient2,
                ]
            )
        ),
        child: Center(
          child: Text(text, style:CustomStyle.kCustomTextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: OtherConstant.kRegularTextSize ) ,),
        ),
      ),
    );
  }

  static kBackButton({required context,onPressed,alignment =Alignment.centerLeft})=>Align(
    alignment: alignment,
    child: TextButton.icon(
      onPressed:onPressed?? () {
        Navigator.pop(context);
      },
      label: Text(LocalString.BACK_BUTTON.tr,style: CustomStyle.kCustomTextStyle(color: ColorPath.kPrimaryColor),),
      icon: Icon(
        Icons.arrow_back,
        size: OtherConstant.kVerySmallIconSize+2,
      ),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero)),
    ),
  );



}
