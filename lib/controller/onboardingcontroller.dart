import 'package:app1/core/routes.dart';
import 'package:app1/datasource/static/onboardingList.dart';
import 'package:app1/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Onboardingcontroller extends GetxController{
  next();
  onpagechanged(int index);
}


class onboardingcontrollerImp extends Onboardingcontroller{

  late PageController pageController;
  int currintpage = 0 ;
  MyServices myServices = Get.find();

  @override
  next() {

    currintpage++ ;
    if(currintpage > onboardinglist.length -1 ){
       myServices.sharedPreferences.setString("step", "1");
      Get.toNamed(Approute.login);

    }else{
      pageController.animateToPage(currintpage, duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
    }
  
  }

  @override
  onpagechanged(int index) {
   currintpage =index ;
    update();

  }
  
@override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}


