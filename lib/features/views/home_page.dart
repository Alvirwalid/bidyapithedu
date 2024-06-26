import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/asset_path.dart';
import '../../constants/color_path.dart';
import '../../constants/local_string.dart';
import '../../constants/other_constant.dart';
import '../../shared_components/custom_style.dart';
import '../../shared_components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPath.kWhite,
        drawer: DrawerList(),

      appBar: AppBar(
        backgroundColor: ColorPath.kAccentColor,
          iconTheme: IconThemeData(color: ColorPath.kWhite),
        title:Text('Dashboard',style: CustomStyle.kCustomTextStyle(fontSize:20,color: ColorPath.kWhite)),),

        body: ListView(
       // padding: EdgeInsets.symmetric(vertical: OtherConstant.kRegularPadding),
      children: [
        Container(
            color: ColorPath.kBlueLightest,
            width: OtherConstant.kCustomWidth(context),
            height: 250,
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              AssetPath.KHome_font_image,
              width: OtherConstant.kCustomWidth(context),
              height:OtherConstant.kCustomHeight(context) ,
              fit: BoxFit.cover,
            )),
        Container(
          width: OtherConstant.kCustomWidth(context),
          // height: OtherConstant.kCustomHeight(context) * .55,
          padding: EdgeInsets.all(16),
          decoration: CustomStyle.kCustomBoxDecoration(
              // color: ColorPath.kGreyLightest,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16))),
          child:
          GridView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1),
            children: [
              buildGestureDetector(
                asset: AssetPath.kprofile_navy,
                text: "Profile",
                onTap: () {

                },
              ),
              buildGestureDetector(
                asset: AssetPath.kCalander_Attendance_navy,
                text:'Attendance',
                onTap: () {

                },
              ),
              buildGestureDetector(
                asset: AssetPath.kLeave_suitcase_navy,
                text: 'Leave\nApplication',
                onTap: () {

                },
              ),
              buildGestureDetector(
                asset: AssetPath.kApproval_check_navy,
                text: 'Approval',
                onTap: () {

                },
              ),
              // buildGestureDetector(
              //   asset: AssetPath.kEmpDir,
              //   text: 'Employee Directory',
              //   onTap: () {
              //
              //   },
              // ),
            ],
          ),
        )
    ],));
  }

  GestureDetector buildGestureDetector(
      {Function()? onTap, String? asset, String? text}) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: ColorPath.kNavyLightest,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: ColorPath.kNavyLight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorPath.kGreyWhite,
                    child: Image.asset(
                      asset!,
                      height: 20,
                      width: 30,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                text!,
                textAlign: TextAlign.center,
                style: CustomStyle.kCustomTextStyle(
                  color: ColorPath.kGreyMain,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}