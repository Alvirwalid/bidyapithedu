import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/asset_path.dart';
import '../constants/color_path.dart';
import '../constants/local_string.dart';
import '../constants/other_constant.dart';
import '../features/controller/auth_controller.dart';
import '../features/controller/localization_controller.dart';
import 'custom_style.dart';
import 'custom_widget/custom_widgets.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({super.key});

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  final AuthController authController = Get.put(AuthController());
  final LocalizationController localizationController =
      Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return SizedBox(
      width: OtherConstant.kCustomSize(context).width * .9,
      child: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                bottomRight: Radius.circular(35))),
        child: Container(
          padding: EdgeInsets.only(
              top: 40 * 1.6,
              left: 16,
              right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomWidgets.circleCacheImage(
                      context: context,
                      radius: 64,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Md. Chabet Alam',
                        textAlign: TextAlign.left,
                        style: CustomStyle.kCustomTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Senior Software Engineer',
                        textAlign: TextAlign.left,
                        style: CustomStyle.kCustomTextStyle(
                            fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 32,
              ),
              const Divider(
                color: ColorPath.kGreyLight,
              ),
              SizedBox(
                height: 16,
              ),
              drawerItems(
                asset: AssetPath.kabout,
                title: 'About',
                onTap: () {
                  Get.back();
                },
              ),
              SizedBox(
                height: 16,
              ),
              const Divider(
                color: ColorPath.kGreyLight,
              ),
              SizedBox(
                height: 16,
              ),
              drawerItems(
                asset: AssetPath.kprivacy,
                title: 'Privacy Policy',
                onTap: () {
                  Get.back();

                },
              ),
              SizedBox(
                height: 16,
              ),

              const Divider(
                color: ColorPath.kGreyLight,
              ),

              SizedBox(
                height: 16,
              ),
              drawerItems(
                  asset: AssetPath.klogout,
                  title: 'Logout',
                  onTap: () {
                    authController.signOut();
                  }),
              SizedBox(
                height:16,
              ),
              const Divider(
                color: ColorPath.kGreyLight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  drawerItems({title, asset, changeLanguage = false, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset(
              asset,
              width: 20,
              height: 20,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
              child: Text(
            title,
            style: CustomStyle.kCustomTextStyle(),
          )),
          changeLanguage
              ? Obx(() => InkWell(
                    onTap: () {
                      localizationController.isEnglish.value
                          ? localizationController.changeLanguage(false)
                          : localizationController.changeLanguage(true);
                    },
                    child: Container(
                      height: 32,
                      width: 48 * 2,
                      decoration: BoxDecoration(
                          color: ColorPath.kPrimaryColor,
                          borderRadius: BorderRadius.circular(30)),
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
                                  horizontal: 8),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    LocalString.LANGUAGE.tr,
                                    style: CustomStyle.kCustomTextStyle(
                                        color: ColorPath.kWhite,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        height: localizationController
                                                .isEnglish.isTrue
                                            ? 1.0
                                            : 1.5),
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
                            duration: const Duration(milliseconds: 300),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(4),
                              child: FittedBox(
                                child: Container(
                                  height: 25,
                                  width: 25,
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
                    ),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}
