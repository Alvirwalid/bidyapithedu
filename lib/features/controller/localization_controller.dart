import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../constants/local_string.dart';

class LocalizationController extends GetxController{
  var box = GetStorage();
  RxBool isEnglish = RxBool(false);

  @override
  void onInit() {
    super.onInit();
   var readFromStorage =  box.read(LocalString.LANGUAGE_SELECTION_KEY)??true;
    isEnglish.value = readFromStorage;
  }

  changeLanguage(bool value){
    isEnglish.value = value;
    box.write(LocalString.LANGUAGE_SELECTION_KEY,value);
   var local = value ?  Locale(LocalString.LANGUAGE_CODE_ENGLISH,LocalString.COUNTRY_CODE_ENGLISH):Locale(LocalString.LANGUAGE_CODE_BANGLA,LocalString.COUNTRY_CODE_BANGLA);
    Get.updateLocale(local);
    }

}