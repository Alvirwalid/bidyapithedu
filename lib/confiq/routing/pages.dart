
import 'package:bidyapithedu/features/views/auth/otp_page.dart';
import 'package:bidyapithedu/features/views/auth/signUp_page.dart';
import 'package:bidyapithedu/features/views/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../features/views/auth/login_page.dart';
import '../../features/views/main_page.dart';
import 'all_route.dart';

class Pages {
  static final route = [
    GetPage(
      name: AllRouters.SPLASH,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AllRouters.LOGIN_PAGE,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AllRouters.OTP_PAGE,
      page: () => const OTPPage(),
    ),
    GetPage(
      name: AllRouters.SIGN_UP_PAGE,
      page: () => const SignUpPage(),
    ),
  ];
}
