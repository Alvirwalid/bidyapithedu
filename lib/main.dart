
import 'package:bidyapithedu/features/model/employee_info.dart' as emp_info;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'confiq/routing/pages.dart';
import 'constants/color_path.dart';
import 'constants/local_string.dart';
import 'constants/localization_string.dart';
import 'features/model/token.dart' as token;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/views/auth/switch_login_view.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await GetStorage.init();

  ////////////////// HIVE ADAPTER /////////////////

  Hive.registerAdapter(token.TokenAdapter());
  Hive.registerAdapter(token.DataAdapter());
  Hive.registerAdapter(token.PasswordPolicyAdapter());







  ///////////// Hive Box Initialize //////////////

  await Hive.openBox<token.Token>(LocalString.TOKEN_BOX);




  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final _box = GetStorage();
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var local = _box.read(LocalString.LANGUAGE_SELECTION_KEY)??true;
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: LocalString.APP_TITLE.tr,
          debugShowCheckedModeBanner: false,
          getPages: Pages.route,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: ColorPath.kAccentColor),
            useMaterial3: true,
            textTheme: GoogleFonts.soraTextTheme(),
          ),
          locale:local?Locale(LocalString.LANGUAGE_CODE_ENGLISH,LocalString.COUNTRY_CODE_ENGLISH): Locale(LocalString.LANGUAGE_CODE_BANGLA,LocalString.COUNTRY_CODE_BANGLA),
          translations: LocalizationString(),
          home:child,
        );
      },
      child: SwitchLoginPage(),
    );
  }
}

