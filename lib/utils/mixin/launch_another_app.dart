import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/color_path.dart';

class LaunchAnotherApp{
 static  Future<void> launchURL({required final String url}) async {
    if (!await launchUrl(Uri.parse(url),mode:LaunchMode.externalApplication)) {
      Fluttertoast.showToast(msg: 'Sorry, Could not launch apps',backgroundColor: ColorPath.kRed);
    }}


}