
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../constants/api_path.dart';
import '../../constants/asset_path.dart';
import '../../constants/color_path.dart';
import '../../constants/local_string.dart';
import '../../constants/other_constant.dart';
import '../../features/controller/localization_controller.dart';
import '../../features/controller/user_controller.dart';
import 'custom_button.dart';
import '../custom_style.dart';

class CustomWidgets {
  final LocalizationController localizationController = Get.put(LocalizationController());
  static buildGrid({onTap, required image, title, imageSize}) {
    return Material(
      shadowColor: Colors.black45,
      color: Colors.white,
      borderRadius: BorderRadius.circular(OtherConstant.kRegularRadius),
      elevation: 10,
      child: InkWell(
        // splashColor: Colors.teal[100],
        onTap: onTap,
        borderRadius: BorderRadius.circular(OtherConstant.kRegularRadius),
        child: Padding(
          padding: EdgeInsets.all(OtherConstant.kSmallPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: imageSize ?? OtherConstant.kExtraLargeIconSize,
                      width: imageSize ?? OtherConstant.kExtraLargeIconSize,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.fill),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: CustomStyle.kCustomTextStyle(
                      fontSize: OtherConstant.kSmallTextSize,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                      color: ColorPath.kAccentColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static customTextField(
          {String? hint,
          Widget? label,
          Widget? preIcon,
          Widget? endIcon,
          String? Function(String?)? validator,
          bool obscure = false,
          controller,
          readOnly = false,
          inputDecoration,
          EdgeInsetsGeometry? contentPadding,
          Function()? onTap}) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: OtherConstant.kRegularPadding),
        child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obscure,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
              contentPadding: contentPadding,
              prefixIcon: preIcon,
              suffixIcon: endIcon,
              hintText: hint ?? '',
              label: label,
              filled: true,
              fillColor: ColorPath.kGreyWhite,
              border: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius:
                      BorderRadius.circular(OtherConstant.kRegularRadius))),
        ),
      );

  static iconContainer(
      {required IconData asset,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      double? height,
      double? width,
      onTap,
      decoration,
      color}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin ?? EdgeInsets.only(right: OtherConstant.kRegularPadding),
        padding: padding,
        height: height ?? 30.0.sp,
        width: width ?? 30.0.sp,
        decoration: decoration,
        child: Icon(
          asset,
          color: color,
        ),
      ),
    );
  }

  static Container notAvailableContainer({
    // bool isCB = false,
    required context,
    String? asset,
    IconData? icon,
    required String title,
    required String subTitle,
    double? height,
    Color color = ColorPath.kGreyWhite,
    EdgeInsets? padding,
  }) {
    return Container(
      height: height,
      width: OtherConstant.kCustomSize(context).width,
      decoration: CustomStyle.kCustomBoxDecoration(
        color: color,
          borderRadius: BorderRadius.circular(OtherConstant.kRegularRadius)),
      padding: padding ?? EdgeInsets.all(OtherConstant.kRegularPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(
                OtherConstant.kLargePadding + OtherConstant.kSmallPadding),
            height: OtherConstant.kSmallIconSize * 4,
            width: OtherConstant.kSmallIconSize * 4,
            decoration: const BoxDecoration(
                color: ColorPath.kGreenWhite, shape: BoxShape.circle),
            child: Center(
              child: asset != null
                  ? Image.asset(asset)
                  : Icon(
                      icon,
                      size: OtherConstant.kSmallIconSize * 2,
                      color: ColorPath.kPrimaryColor,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: OtherConstant.kRegularPadding,
                bottom: OtherConstant.kLargePadding),
            child: Text(
              title,
              style: CustomStyle.kCustomTextStyle(
                color: ColorPath.kPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: CustomStyle.kCustomTextStyle(color: ColorPath.kGreyMain),
          ),
        ],
      ),
    );
  }




  static Container circleCacheImage({required BuildContext context,url,double? radius}) {
    return url=='' || url==null? Container(
        width: radius??12*4,
        height:radius??12*4,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
          image:  const DecorationImage(
            fit: BoxFit.cover,
            image:AssetImage(AssetPath.kNoImage),
          ),
        )):Container(
        width:radius?.sp??12*4,
        height:radius?.sp??12*4,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
          image:  DecorationImage(
            fit:BoxFit.cover,
            image:CachedNetworkImageProvider (


                ''),
          ),
        ));
  }

  // static complainListItem({complain.Content? item, index, required context}) {
  //   // var date=TimeConvert.toddmmmYYYY(item?.complainDate.toString()??'');
  //   return Container(
  //     margin: EdgeInsets.symmetric(
  //         horizontal: OtherConstant.kLargePadding,
  //         vertical: OtherConstant.kRegularPadding),
  //     padding: EdgeInsets.all(OtherConstant.kRegularPadding),
  //     decoration: CustomStyle.kCustomBoxDecoration(
  //         borderRadius: BorderRadius.circular(OtherConstant.kRegularRadius),
  //         color: ColorPath.kGreyWhite,
  //         shadow: [
  //           BoxShadow(
  //               offset: const Offset(0, 3),
  //               color: ColorPath.kGreenDark.withOpacity(.2),
  //               blurRadius: 5.0)
  //         ]),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.symmetric(
  //               horizontal: OtherConstant.kRegularPadding,
  //               vertical: OtherConstant.kSmallPadding),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 item?.complainId??"",
  //                 style: CustomStyle.kCustomTextStyle(
  //                     color: ColorPath.kGreenBlack,
  //                     fontWeight: FontWeight.w600),
  //               ),
  //               Row(
  //                 children: [
  //                   Padding(
  //                     padding: EdgeInsets.symmetric(
  //                         horizontal: OtherConstant.kSmallPadding,
  //                         vertical: OtherConstant.kSmallPadding),
  //                     child: Icon(
  //                       Icons.circle,
  //                       size: OtherConstant.kVerySmallIconSize,
  //                       color: item?.statusId == 1
  //                           ? ColorPath.kBlueDark
  //                           : item?.statusId == 2
  //                               ? ColorPath.kOrangeDark
  //                               : item?.statusId == 3
  //                                   ? ColorPath.kYellowDark
  //                                   : item?.statusId == 4
  //                                       ? ColorPath.kRedDark
  //                                       : item?.statusId == 5
  //                                           ? ColorPath.kGreenDark
  //                                           : ColorPath.kGreyDark,
  //                     ),
  //                   ),
  //                   Text(
  //                     item?.statusName ?? LocalString.Not_submitted.tr,
  //                     style: CustomStyle.kCustomTextStyle(
  //                         // color: ColorPath.kGreyWhite,
  //                         fontSize: OtherConstant.kSmallTextSize),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(
  //               left: OtherConstant.kRegularPadding,
  //               right: OtherConstant.kRegularPadding,
  //               bottom: OtherConstant.kRegularPadding),
  //           child: Text(
  //             "${item?.subject}",
  //             style: CustomStyle.kCustomTextStyle(
  //               color: ColorPath.kGreyBlack,
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //             width: OtherConstant.kCustomWidth(context),
  //             child: CustomButton.customElevatedButton(
  //                 title: LocalString.View_Details.tr,
  //                 elevation: 0.0,
  //                 onPressed: () {
  //                   Get.to(() => ComplainDetailsPage(
  //                         applicationId: item?.id,
  //                       ));
  //                 }))
  //       ],
  //     ),
  //   );
  // }

  // static Container allApplicationListItem({item, index, applicationType}) {
  //   //
  //   // String date =
  //   //     TimeConvert.toddmmmYYYY(item?.applicationDate.toString() ?? '');
  //
  //   return Container(
  //     margin: EdgeInsets.symmetric(
  //         horizontal: OtherConstant.kLargePadding,
  //         vertical: OtherConstant.kRegularPadding),
  //     // padding: EdgeInsets.all(OtherConstant.kRegularPadding),
  //     decoration: CustomStyle.kCustomBoxDecoration(
  //         borderRadius: BorderRadius.circular(OtherConstant.kRegularRadius),
  //         color: ColorPath.kGreyWhite,
  //         shadow: [
  //           BoxShadow(
  //               offset: const Offset(0, 3),
  //               color: ColorPath.kGreenDark.withOpacity(.2),
  //               blurRadius: 10.0)
  //         ]),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.symmetric(
  //               horizontal: OtherConstant.kLargePadding,
  //               vertical: OtherConstant.kLargePadding),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 "${item?.applicationId??""}",
  //                 style:
  //                     CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w600),
  //               ),
  //               Row(
  //                 children: [
  //                   Padding(
  //                     padding: EdgeInsets.symmetric(
  //                         horizontal: OtherConstant.kSmallPadding),
  //                     child: Icon(
  //                       Icons.circle,
  //                       size: OtherConstant.kVerySmallIconSize,
  //                       color: item?.statusId == 1
  //                           ? ColorPath.kBlueDark
  //                           : item?.statusId == 2
  //                               ? ColorPath.kOrangeDark
  //                               : item?.statusId == 3
  //                                   ? ColorPath.kYellowDark
  //                                   : item?.statusId == 4
  //                                       ? ColorPath.kRedDark
  //                                       : item?.statusId == 5
  //                                           ? ColorPath.kGreenDark
  //                                           : ColorPath.kGreyDark,
  //                     ),
  //                   ),
  //                   Text(
  //                     item?.statusName ?? LocalString.Not_submitted.tr,
  //                     style: CustomStyle.kCustomTextStyle(
  //                         fontSize: OtherConstant.kSmallTextSize),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //         const Divider(
  //           height: 0.0,
  //           color: ColorPath.kGreyLightest,
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(
  //               left: OtherConstant.kLargePadding,
  //               top: OtherConstant.kRegularPadding,
  //               right: OtherConstant.kRegularPadding,
  //               bottom: OtherConstant.kRegularPadding),
  //           child: Text(
  //             "$applicationType",
  //             style: CustomStyle.kCustomTextStyle(),
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(
  //               bottom: OtherConstant.kRegularPadding,
  //               left: OtherConstant.kRegularPadding,
  //               right: OtherConstant.kRegularPadding),
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: CustomButton.customElevatedButton(
  //                     title: LocalString.View.tr,
  //                     backgroundColor: ColorPath.kGreyWhite,
  //                     textColor: ColorPath.kPrimaryColor,
  //                     side: BorderSide(color: ColorPath.kPrimaryColor),
  //                     elevation: 0.0,
  //                     onPressed: () {
  //
  //                       print(applicationType);
  //                       applicationType ==LocalString.Water_Line.tr
  //                           ? Get.to(() => WaterLineApplicationDetailsPage(
  //                                 applicationId: item!.id,
  //                               ))
  //                           : Get.to(() => DeepTubeWellApplicationDetailsPage(
  //                                 applicationId: item!.id,
  //                               ));
  //                     }),
  //               ),
  //               // SizedBox(
  //               //   width: OtherConstant.kRegularPadding,
  //               // ),
  //               // Expanded(
  //               //   child: CustomButton.customElevatedButton(
  //               //       onPressed: () {
  //               //         Get.to(() => const ApplicationFeeDetailsPage());
  //               //       },
  //               //       title: 'Pay Fee',
  //               //       elevation: 0.0),
  //               // ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // static Container waterSupplyBillsListItem({Data? item}) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(
  //         horizontal: OtherConstant.kLargePadding,
  //         vertical: OtherConstant.kRegularPadding),
  //     // padding: EdgeInsets.all(OtherConstant.kRegularPadding),
  //     decoration: CustomStyle.kCustomBoxDecoration(
  //         borderRadius: BorderRadius.circular(OtherConstant.kRegularRadius),
  //         color: ColorPath.kGreyWhite,
  //         shadow: [
  //           BoxShadow(
  //               offset: const Offset(0, 3),
  //               color: ColorPath.kGreenDark.withOpacity(.2),
  //               blurRadius: 10.0)
  //         ]),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         // Padding(
  //         //   padding: EdgeInsets.symmetric(
  //         //       horizontal: OtherConstant.kLargePadding,
  //         //       vertical: OtherConstant.kLargePadding),
  //         //   child: Row(
  //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         //     children: [
  //         //
  //         //
  //         //       Expanded(
  //         //         child: Row(
  //         //           children: [
  //         //             Align(
  //         //               alignment: Alignment.bottomLeft,
  //         //               child: GestureDetector(
  //         //                 onTap: () {
  //         //
  //         //
  //         //
  //         //
  //         //                 },
  //         //                   child: Icon(Icons.file_copy_outlined,color: ColorPath.kBlueDark,size: OtherConstant.kMediumIconSize,)),
  //         //             ),
  //         //             Text('Download Bill Copy')
  //         //           ],
  //         //         ),
  //         //       ),
  //         //       // Expanded(
  //         //       //   child: Text(''
  //         //       //     // TimeConvert.toddmmmYYYY(DateTime.now().toString())
  //         //       //     ,
  //         //       //     style: CustomStyle.kCustomTextStyle(
  //         //       //         fontSize: OtherConstant.kSmallTextSize,
  //         //       //         color: ColorPath.kGreyDark),
  //         //       //   ),
  //         //       // ),
  //         //     ],
  //         //   ),
  //         // ),
  //         Padding(
  //           padding: EdgeInsets.only(
  //               top: OtherConstant.kLargePadding,
  //               left: OtherConstant.kLargePadding,
  //               right: OtherConstant.kLargePadding),
  //           child: Text(
  //             "${item?.monthName??""} - ${item?.billYear??""}",
  //             style: CustomStyle.kCustomTextStyle(
  //                 fontWeight: FontWeight.w600, color: ColorPath.kGreenDark),
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.symmetric(
  //             horizontal: OtherConstant.kLargePadding,
  //             vertical: OtherConstant.kRegularPadding,
  //           ),
  //           child: Row(
  //             children: [
  //               Text(
  //                LocalString.Biil_No.tr,
  //                 style: CustomStyle.kCustomTextStyle(
  //                     color: ColorPath.kGreyMain,
  //                     fontWeight: FontWeight.w600,
  //                     fontSize: OtherConstant.kMediumTextSize),
  //               ),
  //               Text(
  //                 item?.billNo??"",
  //                 style: CustomStyle.kCustomTextStyle(
  //                     fontSize: OtherConstant.kMediumTextSize),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(
  //               left: OtherConstant.kLargePadding,
  //               right: OtherConstant.kRegularPadding,
  //               bottom: OtherConstant.kRegularPadding),
  //           child: Row(
  //             children: [
  //               Text(
  //                LocalString.Client_ID.tr,
  //                 style: CustomStyle.kCustomTextStyle(
  //                     color: ColorPath.kGreyMain,
  //                     fontWeight: FontWeight.w600,
  //                     fontSize: OtherConstant.kMediumTextSize),
  //               ),
  //               Text(
  //                 item?.customerId??"",
  //                 style: CustomStyle.kCustomTextStyle(
  //                     fontSize: OtherConstant.kMediumTextSize),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(
  //               left: OtherConstant.kLargePadding,
  //               right: OtherConstant.kRegularPadding,
  //               bottom: OtherConstant.kRegularPadding),
  //           child: Row(
  //             children: [
  //               Text(
  //                 LocalString.Client_Name.tr,
  //                 style: CustomStyle.kCustomTextStyle(
  //                     color: ColorPath.kGreyMain,
  //                     fontWeight: FontWeight.w600,
  //                     fontSize: OtherConstant.kMediumTextSize),
  //               ),
  //               Text(
  //                 item?.applicantName??"",
  //                 style: CustomStyle.kCustomTextStyle(
  //                     fontSize: OtherConstant.kMediumTextSize),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(
  //               bottom: OtherConstant.kRegularPadding,
  //               left: OtherConstant.kRegularPadding,
  //               right: OtherConstant.kRegularPadding),
  //           child: Row(
  //             children: [
  //               // Expanded(
  //               //   child: CustomButton.customElevatedButton(
  //               //       onPressed: () {
  //               //         Get.to(() => MonthlyFeePage());
  //               //       },
  //               //       title: 'View',
  //               //       backgroundColor: ColorPath.kGreyWhite,
  //               //       textColor: ColorPath.kPrimaryColor,
  //               //       elevation: 0.0),
  //               // ),
  //               // SizedBox(
  //               //   width: OtherConstant.kRegularPadding,
  //               // ),
  //               Expanded(
  //                 child: CustomButton.customElevatedButton(
  //                     onPressed: () {
  //                       Get.to(() => MoneyReceiptPage(item: item));
  //                     },
  //                     title: LocalString.View_Details.tr,
  //                     elevation: 0.0),
  //               ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  customDrawer(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        child: Drawer(
          width: OtherConstant.kCustomSize(context).width * .8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _drawerExplorerItem({
    context,
    onTap,
    title,
    icon,
    changeLanguage = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: OtherConstant.kLargePadding,
            horizontal: OtherConstant.kLargePadding),
        alignment: Alignment.centerLeft,
        decoration: CustomStyle.kCustomBoxDecoration(
            border: const Border(
                bottom: BorderSide(color: ColorPath.kGreyLight, width: 2.0))),
        child: Row(
          children: [
            Icon(
              icon,
              color: ColorPath.kPrimaryColor,
            ),
            SizedBox(
              width: OtherConstant.kRegularPadding,
            ),
            Expanded(
              child: Text(
                title,
                style: CustomStyle.kCustomTextStyle(
                  // fontWeight: FontWeight.w700,
                  color: ColorPath.kAccentColor,
                ),
              ),
            ),
            changeLanguage == true
                ? InkWell(
                    onTap: () => {
                      localizationController.isEnglish.value
                          ? localizationController.changeLanguage(false)
                          : localizationController.changeLanguage(true)
                    },
                    child: Obx(() => Container(
                          height: OtherConstant.kRegularIconSize,
                          width: OtherConstant.kExtraLargeIconSize * 2,
                          decoration: BoxDecoration(
                              color: ColorPath.kPrimaryColor,
                              borderRadius: BorderRadius.circular(
                                  OtherConstant.kLargeRadius)),
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                top: 0,
                                bottom: 0,
                                right: localizationController.isEnglish.isTrue
                                    ? null
                                    : 0,
                                curve: Curves.easeIn,
                                duration: const Duration(milliseconds: 300),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          OtherConstant.kRegularPadding),
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        LocalString.LANGUAGE.tr,
                                        style: CustomStyle.kCustomTextStyle(
                                            color: ColorPath.kGreyWhite,
                                            height: localizationController
                                                    .isEnglish.isTrue
                                                ? 1.0
                                                : 1.5,
                                            fontSize:
                                                OtherConstant.kSmallTextSize,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                top: 0,
                                bottom: 0,
                                right: localizationController.isEnglish.isTrue
                                    ? 0
                                    : null,
                                curve: Curves.easeIn,
                                duration: const Duration(milliseconds: 500),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      OtherConstant.kSmallPadding),
                                  child: FittedBox(
                                    child: Container(
                                      height: OtherConstant.kMediumIconSize,
                                      width: OtherConstant.kMediumIconSize,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorPath.kGreyWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }




static  RichText requiredLabelText({label,isRequire=false}) {
    return RichText(
        text:TextSpan(
            children: [
              TextSpan(
                  text:label,
                  style: CustomStyle.kCustomTextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: OtherConstant.kRegularTextSize
                  )
              ),
              TextSpan(
                  text:  isRequire?'*':'',
                  style: CustomStyle.kCustomTextStyle(
                      color: ColorPath.kRed,
                      fontSize: OtherConstant.kRegularTextSize.sp
                  )
              )
            ]
        )
    );
  }






 static Future<dynamic> confirmationDialog(
     {
       context,Function()? pressedConfirm,
  message
     }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: OtherConstant.kRegularPadding),
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(OtherConstant.kLargePadding)),
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          elevation: 10,
          content:      Container(
            padding: EdgeInsets.all(OtherConstant.kLargePadding),
            width: double.maxFinite,
            decoration: CustomStyle.kCustomBoxDecoration(color: ColorPath.kWhite, borderRadius: BorderRadius.circular(OtherConstant.kLargePadding)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocalString.confirmation.tr,style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w600),),
                Divider(thickness: 2),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical:OtherConstant.kLargePadding),
                    child: Text(message??LocalString.doYouWantToConfirm.tr,style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w600),),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120.sp,
                      child: CustomButton.customElevatedButton(title: LocalString.cancel.tr,backgroundColor: ColorPath.kRedLight,elevation:0,
                        onPressed: () {
                          Get.back();
                        },),
                    ),
                    SizedBox(width: OtherConstant.kRegularPadding),
                    SizedBox(
                      width: 120.sp,
                      child: CustomButton.customElevatedButton(title:LocalString.ok.tr,elevation:0,onPressed:pressedConfirm),
                    ),
                  ],
                )

              ],
            ),
          ),
        );
      },
    );
  }


  //////////// CircleWithStatus////////////////
 static Row circleWithStatus({title,color}) {
    return Row(
      children: [
        Container(
          decoration:BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: color.withOpacity(0.08),
                    spreadRadius: 8
                )
              ]
          ),
          child:  CircleAvatar(
            radius: 4,
            backgroundColor: color,
          ),
        ),
        SizedBox(width:OtherConstant.kRegularPadding*1.5),
        Text(title,style:CustomStyle.kCustomTextStyle(color:color,fontWeight: FontWeight.w600,fontSize: OtherConstant.kMediumTextSize),)
      ],
    );
  }


  static   RichText buildRichText({date,title,isDataBold=false,fontSizeTitle,fontSizeData}) {
    return RichText(
        text: TextSpan(
            children: [
              TextSpan(
                  text:'$title :\n',
                  style: CustomStyle.kCustomTextStyle(
                      color: ColorPath.kGreyMain,
                    fontSize:fontSizeTitle

                  )
              ),
              TextSpan(
                  text:date,
                  style: CustomStyle.kCustomTextStyle(
                      fontWeight:isDataBold? FontWeight.w600:FontWeight.normal,
                    fontSize: fontSizeData
                  )
              ),
            ]
        ));
  }
  static customNetworkImage({urlName, height, width}) {
    return urlName == null
        ? Image.asset(AssetPath.kNoImage,
        fit: BoxFit.cover,
        height: height ?? OtherConstant.kLargeImageHeight,
        width: width ?? OtherConstant.kLargeImageHeight)
        : CachedNetworkImage(
        imageUrl: '${ApiPath.baseUrlImage}$urlName',
        placeholder: (context,st){
          return  const Center(child: CircularProgressIndicator());
        },
        errorWidget: (context, url, error) =>Container(
            height: height ?? OtherConstant.kLargeImageHeight,
            width: width ?? OtherConstant.kLargeImageHeight,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
              image:  const DecorationImage(
                fit: BoxFit.cover,
                image:AssetImage(AssetPath.kNoImage),
              ),
            )),
        fit: BoxFit.cover,
        height: height ?? OtherConstant.kLargeImageHeight,
        width: width ?? OtherConstant.kLargeImageHeight);
  }

  // static TimelineTile stepItem({title, isFirst = false, isLast = false}) {
  //   print(title);
  //   return TimelineTile(
  //     alignment: TimelineAlign.start,
  //     beforeLineStyle:
  //         const LineStyle(thickness: 2.0, color: ColorPath.kPrimaryColor),
  //     afterLineStyle:
  //         const LineStyle(thickness: 2.0, color: ColorPath.kPrimaryColor),
  //     isFirst: isFirst,
  //     isLast: isLast,
  //     endChild: Padding(
  //       padding: EdgeInsets.all(OtherConstant.kRegularPadding),
  //       child: Text(
  //         title,
  //         style: CustomStyle.kCustomTextStyle(),
  //       ),
  //     ),
  //     indicatorStyle: const IndicatorStyle(color: ColorPath.kPrimaryColor),
  //   );
  // }
}
