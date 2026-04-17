import 'package:app1/controller/onboardingcontroller.dart';
import 'package:app1/datasource/static/onboardingList.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Listganiratedonboarding extends StatelessWidget {
  const Listganiratedonboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onboardingcontrollerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onboardinglist.length,
            (index) => AnimatedContainer(
              duration: Duration(milliseconds: 100),
              width: controller.currintpage == index ? 20 :10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
