import 'dart:math';

import 'package:app1/controller/onboardingcontroller.dart';
import 'package:app1/datasource/static/onboardingList.dart';
import 'package:app1/widget/onboarding/listganiratedonboarding.dart';
import 'package:app1/widget/onboarding/materialbuttomonboarding.dart';
import 'package:app1/widget/onboarding/pageviewonpoarding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onboarding extends StatelessWidget {
  const onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(onboardingcontrollerImp());
    return Scaffold(
      appBar: AppBar(title: Text("onboarding page")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child:Pageviewonpoarding()
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                 Listganiratedonboarding(),
                  Spacer(flex: 2),
                  Materialbuttomonboarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
