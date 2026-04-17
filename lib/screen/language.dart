import 'package:app1/core/routes.dart';
import 'package:app1/localization/changelang.dart';
import 'package:app1/screen/onboarding.dart';
import 'package:app1/widget/language.dart/bottonLanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr,style:Theme.of(context).textTheme.displayLarge),
            SizedBox(height: 30,),

            Bottonlanguage(textbutton: 'Ar',onPressed: () {
              controller.Changelang("ar");
              Get.toNamed(Approute.onboarding);
            },),
            Bottonlanguage(textbutton: 'En',onPressed: () {
              controller.Changelang("en");
              Get.toNamed(Approute.onboarding);
            },),
          
          ],
        ),
      ),
    );
  }
}
