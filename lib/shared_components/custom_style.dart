import 'package:flutter/material.dart';

import '../constants/color_path.dart';
import '../constants/other_constant.dart';


class CustomStyle {
  static TextStyle kCustomTextStyle(
          {double? fontSize,
            FontWeight? fontWeight = FontWeight.normal,
          Color color = ColorPath.kGreyBlack,double? height,
            TextDecoration? decoration}) =>
      TextStyle(
        fontSize: fontSize ??OtherConstant.kRegularTextSize,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
        height: height
      );

  static kCustomTextFieldDecoration(
      {String? hintText,
        TextStyle? hintTextStyle,
        InputBorder? border,
        BoxConstraints? boxConstraints,
        double? prefixIconSize,
        Widget? label,
        Widget? suffixIcon,
        bool floatingLabelBehavior = false,
        EdgeInsetsGeometry? contentPadding,
        Color? fillColor}) {
    return InputDecoration(

        floatingLabelBehavior:
        floatingLabelBehavior ? FloatingLabelBehavior.always : null,
        hintText: hintText,
        hintStyle: hintTextStyle ??
        CustomStyle.kCustomTextStyle(color: ColorPath.kGreyMain, fontSize: 12,),
        label:label,
        contentPadding:contentPadding??EdgeInsets.symmetric(horizontal:16, vertical: 14),
        enabledBorder: border ??OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
        focusedBorder:border ??OutlineInputBorder( borderRadius:BorderRadius.circular(10)),
        border:border ??OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
        filled: true,

        fillColor: fillColor ?? ColorPath.kGreyLightest,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints.tightFor(
          width: 30,
          height: 30,
        ),
        prefixIconConstraints: BoxConstraints.tightFor(
          width: prefixIconSize ?? 40,
          height: prefixIconSize ?? 40,
        )

    );
  }

  static kCustomBoxDecoration(
      {Color color = ColorPath.kGreyWhite,
      borderRadius,
      List<BoxShadow>? shadow, ImageProvider<Object>? image,
      BoxBorder? border}) {
    return BoxDecoration(
        color: color,
        image:image != null? DecorationImage(image: image):null,
        borderRadius: borderRadius,
        boxShadow: shadow,
        border: border);
  }
}
