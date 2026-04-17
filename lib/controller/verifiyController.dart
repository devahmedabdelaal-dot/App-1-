
import 'package:app1/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Verifiycontroller extends GetxController {
  chekeCode();
  GoToResetPassword();
}
class VerifiycontrollerImp extends Verifiycontroller{

 late String verifycode ;
 
  chekeCode() {
    
    throw UnimplementedError();
  }
  
  @override
  GoToResetPassword() {
    Get.offNamed(Approute.Reseatpassword);
    
    throw UnimplementedError();
  }

@override
  void onInit() {
 
   
    super.onInit();
  }

 


}