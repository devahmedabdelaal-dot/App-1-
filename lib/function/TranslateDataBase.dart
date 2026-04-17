import 'package:app1/services/services.dart';
import 'package:get/get.dart';

TranslateDataBase(columnAr , columnEn){
MyServices myServices = Get.find();
if(myServices.sharedPreferences.getString("Lang") == "ar"){

return columnAr ;
}else{
  return columnEn ;
}

}