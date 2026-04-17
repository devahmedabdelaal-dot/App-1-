import 'package:app1/controller/signupController.dart';
import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/function/validinput.dart';
import 'package:app1/widget/authLohin/BottonLogin.dart';
import 'package:app1/widget/authLohin/RowLoginSinup.dart';
import 'package:app1/widget/authLohin/textBodyLogin.dart';
import 'package:app1/widget/authLohin/textFormLogin.dart';
import 'package:app1/widget/authLohin/texttitleLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    // signupControllerImp controller =
     Get.put(signupControllerImp());
    // TextEditingController email;
    // TextEditingController password;
    return Scaffold(
      appBar: AppBar(
        title: Text("17".tr, style: Theme.of(context).textTheme.displayLarge),
        centerTitle: true,
      ),

      body: GetBuilder<signupControllerImp>(builder: (controller)=>
      controller.statusrequest == Statusrequest.loading ? Center(child: CircularProgressIndicator()) :
      Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              SizedBox(height: 20),
              Texttitlelogin(title: '10'.tr),
              SizedBox(height: 20),
          
              Textbodylogin(body: '24'.tr),
              SizedBox(height: 20),
          
              Textformlogin(
                hintText: '23'.tr,
                labeltext: '20'.tr,
                iconData: Icons.person_outline_rounded,
                textcontroller: controller.user,
                valid: (val) {
                  return ValidInput(val!, 2, 100, "username");
                } , isNumber: false ,
              ),
              Textformlogin(
                obscureText: false,
                hintText: '22'.tr,
                labeltext: '21'.tr,
                iconData: Icons.phone_outlined,
                textcontroller: controller.phone,
                valid: (val) { 
                  return ValidInput(val!, 2, 100, "phone");
                  }, isNumber: true ,
              ),
              Textformlogin(
                obscureText: false,
                hintText: '12'.tr,
                labeltext: '18'.tr,
                iconData: Icons.email_outlined,
                textcontroller: controller.email,
                valid: (val) {
                   return ValidInput(val!, 2, 100, "email");
                } , isNumber: false ,
              ),
          
               GetBuilder<signupControllerImp>(
                  builder:(controller)=> Textformlogin(
                    obscureText: controller.isShowPassword,
                    onTapicon: () {
                      controller.ShowPassword();
                    },
                    hintText: '13'.tr,
                    labeltext: '19'.tr,
                    iconData: Icons.lock_outline,
                    textcontroller: controller.password,
                     valid: (val) {
                      return ValidInput(val!, 6, 20, "password");
                      } , isNumber: false ,
                  ),
                ),
              Bottonlogin(
                text: '17'.tr,
                onPressed: () {
                  
                  controller.signup();
                },
              ),
              SizedBox(height: 20),
              Rowloginsinup(
                text: '15'.tr,
                onTap: () {
                  controller.GoTosignin();
                },
                text2: '25'.tr,
              ),
            ],
          ),
        ),
      ),)
    );
  }
}
