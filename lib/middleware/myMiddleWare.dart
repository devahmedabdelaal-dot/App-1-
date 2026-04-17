import 'package:app1/core/routes.dart';
import 'package:app1/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware{

int ? get priority => 1;

 MyServices myServices= Get.find();

RouteSettings? redirect(String? route){

if(myServices.sharedPreferences.getString("step")=="2"){
 return RouteSettings(name: Approute.home);
}
if(myServices.sharedPreferences.getString("step")=="1"){
 return RouteSettings(name: Approute.login);
}

}



}