
import 'package:bidyapithedu/constants/other_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/asset_path.dart';
import '../../constants/color_path.dart';
import '../custom_style.dart';

class CustomAppBar{
  static AppBar appbar({title}) => AppBar(
    backgroundColor: ColorPath.kPrimaryColor,
    leading: InkWell(onTap: (){Get.back();},
        child: Icon(Icons.arrow_back_ios,color: ColorPath.kWhite,)
    ),
    title: Text(title??'',style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w600,color: ColorPath.kGreyWhite,fontSize:OtherConstant.kMediumTextSize.sp),
    ),
  );


}