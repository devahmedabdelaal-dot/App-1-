
import 'package:app1/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifiySignupcontroller extends GetxController {
  chekeCode();
  GoTosuccessSignup();
}
class VerifiySignupcontrollerImp extends VerifiySignupcontroller{

 late String verifycode ;
 
  chekeCode() {
    
    throw UnimplementedError();
  }
  
  @override
  GoTosuccessSignup() {
    Get.offNamed(Approute.Successsinup);
    
    throw UnimplementedError();
  }

@override
  void onInit() {
 
   
    super.onInit();
  }

 


}