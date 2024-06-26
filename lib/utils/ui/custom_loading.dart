import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/asset_path.dart';
import '../../constants/color_path.dart';
import '../../constants/other_constant.dart';
import '../../shared_components/custom_style.dart';

class CustomLoading {


  static loadingScreen({height, width, margin}) => Center(
      child: Container(
        // margin: margin ?? const EdgeInsets.symmetric(vertical: 100),
          height: height ?? OtherConstant.kDefaultImageHeight,
          width: width ?? OtherConstant.kDefaultImageHeight,
          decoration:  const BoxDecoration(image:DecorationImage(image:  AssetImage(AssetPath.logo),scale: 1.5),
              shape: BoxShape.circle, color: ColorPath.kGreyWhite),
          child: const CircularProgressIndicator()));



  static loadingDialog() => Get.dialog(
      Center(
          child: Container(
              height:OtherConstant.kDefaultImageHeight,
              width: OtherConstant.kDefaultImageHeight,
              decoration: const BoxDecoration(
                  image:DecorationImage(image:  AssetImage(AssetPath.logo),scale: 1.5),
                  shape: BoxShape.circle, color: ColorPath.kGreyWhite),
              child: const CircularProgressIndicator())),
      barrierDismissible: false);


  // static loadingDialog() => Get.dialog(
  //     Center(
  //         child: Container(
  //             height:OtherConstant.kDefaultImageHeight,
  //             width: OtherConstant.kDefaultImageHeight,
  //             decoration: const BoxDecoration(image:DecorationImage(image:  AssetImage(AssetPath.logo),scale: 1.5),
  //                 shape: BoxShape.circle, color: ColorPath.kGreyWhite),
  //             child: const CircularProgressIndicator())),
  //     barrierDismissible: false);



  static Padding pdfLoading({progress}) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: OtherConstant.kLargePadding * 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Downloading...',
            style: CustomStyle.kCustomTextStyle(),
          ),
          SizedBox(
            height: OtherConstant.kRegularPadding,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: progress,
                color: ColorPath.kPrimaryColor,
                minHeight: OtherConstant.kLargePadding,
                backgroundColor: ColorPath.kGreyLight,
              )),
        ],
      ),
    );
  }

  static Padding shimmerLoadingScreen(BuildContext context, {itemCount = 2}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: OtherConstant.kLargePadding),
      child: Shimmer.fromColors(
          baseColor: ColorPath.kGreyLight,
          highlightColor: Colors.white,
          child: ListView.builder(
              itemCount: itemCount,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: OtherConstant.kLargePadding,
                          bottom: OtherConstant.kRegularPadding),
                      height: OtherConstant.kLargePadding,
                      width: OtherConstant.kCustomWidth(context),
                      color: ColorPath.kGreyWhite,
                    ),
                    Container(
                      height: OtherConstant.kLargePadding,
                      width: 100,
                      color: ColorPath.kGreyWhite,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: OtherConstant.kLargePadding,
                          top: OtherConstant.kRegularPadding),
                      height: OtherConstant.kLargePadding,
                      width: OtherConstant.kCustomWidth(context),
                      color: ColorPath.kGreyWhite,
                    ),
                  ],
                );
              })),
    );
  }
}
