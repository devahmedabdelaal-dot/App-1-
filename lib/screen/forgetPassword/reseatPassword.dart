
import 'package:app1/controller/resetpasswordController.dart';
import 'package:app1/function/validinput.dart';
import 'package:app1/widget/authLohin/BottonLogin.dart';
import 'package:app1/widget/authLohin/textBodyLogin.dart';
import 'package:app1/widget/authLohin/textFormLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reseatpassword extends StatelessWidget {
  const Reseatpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetpasswordcontrollerImp controller = Get.put(ResetpasswordcontrollerImp());
    // TextEditingController email;
    // TextEditingController password;
    return Scaffold(
      appBar: AppBar(
        title: Text(" reset password ", style: Theme.of(context).textTheme.displayLarge),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
          
              
               SizedBox(height: 20),
             
            
             
              
              Textbodylogin(
                body:
                    '34'.tr,
              ),
              SizedBox(height: 20),
          
            
            
              Textformlogin(
                valid: (val) {
                  return ValidInput(val!, 6, 50, "password");
                },
                hintText: '34'.tr,
                labeltext: '35'.tr,
                iconData: Icons.lock_outline, textcontroller: controller.password, isNumber: false,
              ),
              Textformlogin(
                 valid: (val) {
                  return ValidInput(val!, 6, 50, "password");
                },
                hintText: '34'.tr,
                labeltext: '35'.tr,
                iconData: Icons.lock_outline, textcontroller: controller.rePassword, isNumber: false,
              ),
          
              
               Bottonlogin(text: '33'.tr,onPressed: (){
                controller.GoToSuccessResetpassword();
               },),
               SizedBox(height: 20,),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
