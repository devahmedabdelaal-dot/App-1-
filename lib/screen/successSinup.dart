import 'package:app1/core/routes.dart';
import 'package:app1/widget/authLohin/BottonLogin.dart';
import 'package:app1/widget/authLohin/textBodyLogin.dart';
import 'package:app1/widget/authLohin/texttitleLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Successsinup extends StatelessWidget {
  const Successsinup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('32'.tr, textAlign: TextAlign.center)),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Center(
              child: Icon(
                Icons.check_circle_outline_outlined,
                size: 200,
                color: Colors.lightBlue,
              ),
              
            ),
            SizedBox(height: 30,),
            Texttitlelogin(title: '32'.tr),
            SizedBox(height: 10,),
            Textbodylogin(body: '27'.tr,),
            Spacer(),
            Container(
              width: double.infinity,
              child: Bottonlogin(text: '31'.tr,onPressed: () {
                 Get.offAllNamed(Approute.login);
              },),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
