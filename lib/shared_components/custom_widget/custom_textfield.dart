import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../constants/color_path.dart';
import '../../constants/local_string.dart';
import '../../constants/other_constant.dart';
import '../custom_style.dart';

class CustomTextField {

  static kCustomTextField(
      {double? height,
        Widget? suffixIcon,
        Widget? prefixIcon,
        BoxConstraints? boxConstraints,
        Widget? label,
        String? hint = '',
        bool readOnly = false,
        bool floatingLabelBehavior = false,
        TextEditingController? controller,
        String? Function(String?)? validator,
        Function()? onPresses,
        int? maxLine = 1,
        Function(String)? onChanged,
        InputDecoration? decoration,
        TextStyle? textStyle,
        InputBorder? border,
        bool obscureText = false,
        bool enable = true,
        Color? fillColor,
        double? prefixIconSize,
        EdgeInsetsGeometry? contentPadding,
        EdgeInsetsGeometry? padding,
        List<TextInputFormatter>? inputFormatters,
        AutovalidateMode? autovalidateMode,
        FocusNode? focusNode,
        TextInputType? textInputType}) {
    return TextFormField(
      enabled: enable,
      style: textStyle??CustomStyle.kCustomTextStyle(fontSize: OtherConstant.kMediumTextSize),
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      onChanged: onChanged,
      maxLines: maxLine,
      focusNode: focusNode,
      onTap: onPresses,
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: obscureText,

      decoration: decoration ??
          CustomStyle.kCustomTextFieldDecoration(
            label: label,
            hintText: hint,
            suffixIcon: suffixIcon,
            boxConstraints: boxConstraints,
            border: border,
            floatingLabelBehavior: floatingLabelBehavior,
            contentPadding: contentPadding,
            fillColor: fillColor,
            prefixIconSize: prefixIconSize,
          ),
      inputFormatters: inputFormatters,
      autovalidateMode: autovalidateMode,
    );
  }






  static kCustomOtpField({controller, onChanged, focusNode}) {
    return TextFormField(
      style: CustomStyle.kCustomTextStyle(
          fontSize: OtherConstant.kHeadlineTextSize,
          fontWeight: FontWeight.w500,
          color: ColorPath.kBlack,
          height: 1.2),
      controller: controller,
      validator: (val) =>val.toString().isEmpty? '':null,
      onChanged: onChanged,
      focusNode: focusNode,
      // readOnly: true,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(OtherConstant.kRegularPadding),
        ),
        contentPadding: EdgeInsets.all(OtherConstant.kRegularPadding),
      ),
      keyboardType: TextInputType.number,
    );
  }
  static kCustomDropdown(
      {String label = '',
        Widget? hint,
        String? Function(Object?)? validator,
        Function(Object?)? onChanged,
        List<DropdownMenuItem<Object>>? item,
        EdgeInsetsGeometry? contentPadding,
        borderRadius,
        Object? selectValue,
        AlignmentGeometry? alignment,
        // bool isExpanded = false,
        Color?borerColor,
        InputDecoration? decoration}) {
    return DropdownButtonFormField(
      alignment: alignment ?? Alignment.topLeft,
      value: selectValue,
      style: CustomStyle.kCustomTextStyle(),
      onChanged: onChanged,
      items: item,
      iconSize: OtherConstant.kMediumTextSize,
      icon: Transform.rotate(angle: 11, child: Icon(Icons.arrow_back_ios_new)),
      validator: validator,
      isExpanded: true,
      decoration: decoration ??
          InputDecoration(
            fillColor: ColorPath.kWhite,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:borerColor??ColorPath.kBlack
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(OtherConstant.kRegularPadding)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: borerColor??ColorPath.kBlack
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(OtherConstant.kRegularPadding)),
            border:  OutlineInputBorder(
                borderSide: BorderSide(
                    color: borerColor??ColorPath.kBlack
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(OtherConstant.kRegularPadding)),
            label: Text(label),
            hintStyle: CustomStyle.kCustomTextStyle(color: ColorPath.kGreyDark),
            contentPadding: contentPadding,
          ),
      hint: hint ??
          Text(LocalString.SelectOption.tr,
              style: CustomStyle.kCustomTextStyle()),
    );
  }

  static kCustomSearchBar({context,padding,border,onChanged,focusNode,controller}) {
    return TextFormField(
      cursorColor: ColorPath.kBlack,
      onChanged: onChanged,
      controller: controller,
      // focusNode: focusNode,

      decoration: InputDecoration(
        contentPadding: padding,
        border:border?? const UnderlineInputBorder(borderSide: BorderSide.none),

        isDense: true,
        hintText: LocalString.SEARCH.tr,

        hintStyle: CustomStyle.kCustomTextStyle(color: ColorPath.kColorGrey3,),
        prefixIconConstraints: BoxConstraints.tight(Size(OtherConstant.kRegularIconSize,OtherConstant.kLargePadding)),
        prefixIcon: Icon(FeatherIcons.search,color: ColorPath.kGreenMain,size: OtherConstant.kVerySmallIconSize),
        // filled: isFilled,fillColor: ColorPath.kColorWhite

      ),
      style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w500,
          height: 1.2),
    );
  }
}
