import 'package:app1/core/routes.dart';
import 'package:app1/services/services.dart';
import 'package:get/get.dart';

class Settingcontroller extends GetxController {

  MyServices myServices = Get.find();

  logout(){
    myServices.sharedPreferences.clear();
    Get.offAllNamed(Approute.login);
  }
}