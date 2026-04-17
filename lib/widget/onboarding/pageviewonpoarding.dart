import 'package:app1/controller/onboardingcontroller.dart';
import 'package:app1/datasource/static/onboardingList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pageviewonpoarding extends GetView<onboardingcontrollerImp> {
  const Pageviewonpoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onpagechanged(val);
      },
                itemCount: onboardinglist.length,
                itemBuilder: (context, i) => Column(
                  children: [
                    Text(
                      onboardinglist[i].title!,
                      style:Theme.of(context).textTheme.displayLarge
                    ),
                    SizedBox(height: 80),
                    Image.asset(
                      onboardinglist[i].image!,
                      width: 200,
                      height: 230,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 80),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        onboardinglist[i].body!,
                        style: Theme.of(context).textTheme.bodyLarge
                      ),
                    ),
                  ],
                ),
              );
  }
}