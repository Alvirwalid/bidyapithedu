
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/asset_path.dart';
import '../../constants/color_path.dart';
import '../custom_style.dart';

class CustomAppBar{
  static AppBar appbar({title}) => AppBar(backgroundColor: ColorPath.kGreenDark,leading: InkWell(onTap: (){Get.back();},child: Image.asset(AssetPath.icon_back)),title: Text(title??'',style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w600,color: ColorPath.kGreyWhite),),);

}