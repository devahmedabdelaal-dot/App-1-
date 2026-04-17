import 'package:app1/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  Changelang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);

  }
  
  @override
  void onInit() {
    String? sherdPrefLang = myServices.sharedPreferences.getString("lang");
    if(sherdPrefLang == "ar"){
      language = const Locale("ar");
    }else if(sherdPrefLang == "en"){
       language = const Locale("en");
    }else{
        language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }


}
