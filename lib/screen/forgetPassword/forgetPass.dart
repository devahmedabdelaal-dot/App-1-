import 'package:app1/controller/forgetpassControllere.dart';
import 'package:app1/function/validinput.dart';
import 'package:app1/widget/authLohin/BottonLogin.dart';
import 'package:app1/widget/authLohin/textBodyLogin.dart';
import 'package:app1/widget/authLohin/textFormLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgetpass extends StatelessWidget {
  const Forgetpass({super.key});

  @override
  Widget build(BuildContext context) {
    forgetpassControllerImp controller = Get.put(forgetpassControllerImp());
    // TextEditingController email;
    // TextEditingController password;
    return Scaffold(
      appBar: AppBar(
        title: Text("14".tr, style: Theme.of(context).textTheme.displayLarge),
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
                    '29'.tr,
              ),
              SizedBox(height: 20),
          
            
            
              Textformlogin(
                hintText: '12'.tr,
                labeltext: '18'.tr,
                iconData: Icons.email_outlined, textcontroller: controller.email, valid: (val) { 
                  return ValidInput(val!, 10, 100, "email");
                 } , isNumber: false ,
              ),
          
              
               Bottonlogin(text: '30'.tr,onPressed: (){
                controller.GoToveryfiyCode();
               },),
               SizedBox(height: 20,),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
