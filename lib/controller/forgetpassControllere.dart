
import 'package:app1/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Forgetpasscontrollere extends GetxController {
  chekeEmail();
  GoToveryfiyCode();
}
class forgetpassControllerImp extends Forgetpasscontrollere{

  GlobalKey<FormState>formstate =GlobalKey<FormState>();

 late TextEditingController email ;
 
  chekeEmail() {
    
    throw UnimplementedError();
  }
  
  @override
  GoToveryfiyCode() {
    if(formstate.currentState!.validate()){
       Get.offNamed(Approute.Verifiyccode);
    }else{
      print('NOT VALID');
    }
   
    
    throw UnimplementedError();
  }

@override
  void onInit() {
   email =TextEditingController();
   
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
   
    super.dispose();
  }


}