
import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/datasource/remote/login_Data.dart';
import 'package:app1/function/handlingData.dart';
import 'package:app1/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';





abstract class Logincontroller extends GetxController {
  Login();
  GoTosignup();
}
class LoginControllerImp extends Logincontroller{

 
 LoginData loginData = LoginData(Get.find());
  

  GlobalKey<FormState>formstate =GlobalKey<FormState>();

 late TextEditingController email ;
 late TextEditingController password ;

 bool isShowPassword =true ;
 Statusrequest statusrequest =Statusrequest.none ;

 MyServices myServices = Get.find();



ShowPassword(){
  isShowPassword =isShowPassword == true ? false : true ;
  update();
}



  @override
  Login()async {
    
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;

      var response = await loginData.postdata(
       
        password.text,
        email.text,
       
      );
      statusrequest = handlingData(response);
      if (statusrequest == Statusrequest.success) {
        // data.addAll (response['data']) ;
       myServices.sharedPreferences.setString(
    "id", response['data']['users_id'].toString());

        myServices.sharedPreferences.setString("username",  response['data']['users_name']);
        myServices.sharedPreferences.setString("email",  response['data']['users_email']);
        myServices.sharedPreferences.setString("phone",  response['data']['users_phone']);
        myServices.sharedPreferences.setString("step", '2');
        print("Saved ID: ${myServices.sharedPreferences.getString("id")}");

        Get.offNamed(Approute.home);
      } else {
       
        Get.defaultDialog(
          title: "Warning",
          middleText: "Email Or password not true",
        );
        statusrequest = Statusrequest.failure;
      }
      update();
    } else {
      print('NOT VALID==========================');
      
     
    }
   
  }
  
  @override
  GoTosignup() {
    Get.offNamed(Approute.Signup);
    
    throw UnimplementedError();
  }

@override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
   email =TextEditingController();
   password =TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }


}