import 'package:app1/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Materialbuttomonboarding extends GetView<onboardingcontrollerImp> {
  const Materialbuttomonboarding({super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
                    margin: EdgeInsets.only(bottom: 30),
                    height: 40,
                    child: MaterialButton(
                      onPressed: () {
                        controller.next();
                      },
                      textColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 2,
                      ),
                      color: Colors.lightBlue,
                      child: Text("39".tr),
                    ),
                  );
  }
}