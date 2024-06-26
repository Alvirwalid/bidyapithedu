import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/asset_path.dart';
import '../../constants/color_path.dart';
import '../../shared_components/custom_style.dart';

class CustomAppbar{

  static AppBar appBar({title}){
    return AppBar(
      backgroundColor: ColorPath.kGreenDark,
      leading: InkWell(onTap: (){
        Get.back();
      },
      child: Image.asset(AssetPath.icon_back)),
      title: Text(title,style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w600,color: ColorPath.kGreyWhite),),);
  }
}