import 'package:app1/controller/logincontroller.dart';
import 'package:app1/core/class/handlingDataView.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/function/alertExitApp.dart';
import 'package:app1/function/validinput.dart';
import 'package:app1/widget/authLohin/BottonLogin.dart';
import 'package:app1/widget/authLohin/RowLoginSinup.dart';
import 'package:app1/widget/authLohin/logoLogin.dart';
import 'package:app1/widget/authLohin/textBodyLogin.dart';
import 'package:app1/widget/authLohin/textFormLogin.dart';
import 'package:app1/widget/authLohin/texttitleLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    // TextEditingController email;
    // TextEditingController password;
    return Scaffold(
      appBar: AppBar(
        title: Text("9".tr, style: Theme.of(context).textTheme.displayLarge),
        centerTitle: true,
      ),

      body: WillPopScope(
        onWillPop: alertExitApp,
        child:  handlingDataView(statusrequest: controller.statusrequest, widget: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                Logologin(),
                SizedBox(height: 20),
                Texttitlelogin(title: '10'.tr),
                SizedBox(height: 20),
            
                Textbodylogin(body: '11'.tr),
                SizedBox(height: 20),
            
                Textformlogin(
                  obscureText: false,
                  hintText: '12'.tr,
                  labeltext: '18'.tr,
                  iconData: Icons.email_outlined,
                  textcontroller: controller.email,
                  valid: (val) {
                   return ValidInput(val!, 5, 100, "email");
                  }, isNumber: false ,
                ),
            
                GetBuilder<LoginControllerImp>(
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
                InkWell(
                  onTap: () {
                    Get.toNamed(Approute.forgetpass);
                  },
                  child: Text('14'.tr, textAlign: TextAlign.end),
                ),
                Bottonlogin(text: '15'.tr, onPressed: () {
                  controller.Login();
                }),
                SizedBox(height: 20),
                Rowloginsinup(
                  text: '17'.tr,
                  onTap: () {
                    controller.GoTosignup();
                  },
                  text2: '16'.tr,
                ),
              ],
            ),
          ),
        ),)
      ),
    );
  }
}
